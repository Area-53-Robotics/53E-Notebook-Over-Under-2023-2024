#import "@local/notebookinator:0.1.0": *
#import themes.radial.components: *

#import "@preview/diagraph:0.2.0": *

#import "@preview/codetastic:0.2.2": qrcode

#show:  create_body_entry.with(
  title: "Program: Data Visualization",
  type: "program",
  start_date: datetime(year: 2023, month: 11, day: 18),
)

Now what we had a rough idea of what we were doing we could implement them. If you want to see our final implementation you can look at it on our GitHub. #footnote(
  [
    Our implementation:
    #align(bottom, qrcode("https://github.com/BattleCh1cken/loginator", size: 2pt))
    ]
). We call it the Loginator.

= Project Overview

We decided to write this in Rust, mainly due to Rust's strong ecosystem when it comes to command line tools. There were also existing Rust libraries for MQTT and Bluetooth. We ended up using the following libraries:
- Clap as a CLI #footnote("See glossary.") framework.
- Btleplug as our Bluetooth library
- Rumqttc as our MQTT library

The tool establishes a Bluetooth connection with the Brain, and then polls it for data. Once data is received, that data is decoded from COBS, and then parsed. Once we have our data, it can be sent to a local MQTT broker. The one we use is called Mosquitto.

= Bluetooth

Obtaining a Bluetooth connection is the most difficult part of the whole process. The process for connecting and polling from the brain looks like this:

+ Check for Brains in the surrounding area
+ Have the user chose which Brain is theirs
+ Have the user input their Brain's Bluetooth code 
+ Check if the code is correct
+ Receive data from the brain

Most of this is relatively simple and doesn't differ from Btleplug's example code, but the authentication is a little more complicating, so we'll go over it here.

The first thing we need to do is have the Brain display it's 4 digit authentication codeon it's LCD screen. We can do this by sending a packet containing `0xfffffffff` to it's system characteristic. For the uninitiated, a characteristic is like a channel for information to be read/written to for a Bluetooth device.
```rs
let characteristic = Self::find_characteristic(&brain, SYSTEM_CHAR).unwrap();
brain
  .write(
    &characteristic,
    &[0xff, 0xff, 0xff, 0xff], // This tells the brain to display the verification code on it's screen
    WriteType::WithResponse,
  )
  .await
  .unwrap();
```

Once we receive the code from the user we need to send the code to the brain from our application to verify ourselves.

```rs
// We need to convert the code from a string to bytecode
let code: Vec<u8> = code
  .trim()
  .chars()
  .map(|c| c.to_digit(10).unwrap() as u8)
  .collect();


let characteristic = Self::find_characteristic(&brain, SYSTEM_CHAR).unwrap();

// Send the code to the Brain
brain
  .write(&characteristic, &code, WriteType::WithResponse)
  .await
  .unwrap();

 // If the code was correct the Brain will echo it back to us from the same characteristic
 let response = brain.read(&characteristic).await.unwrap();

 if response != code {
  return Err(BrainControllerError::IncorrectCode);
 }
```

= COBS

Once we have a connection with the brain, decoding the information coming off it isn't so simple. PROS #footnote("See glossary.") uses an algorithm called COBS (consistent overhead byte stuffing) to encode its data. This has a few benefits, but it also means that we can't read the information coming off the Brain directly. We'll need to decode it first.

COBS' main application is that it allows us to verify the integrity of packets with as little overhead as possible. It does this by adding a `0x00` byte after every packet. It then adds a byte at the beginning of the packet who's value is equal to how many bytes away the next `0x00` byte is.

#image("./basic-cobs.svg", width: 40%)

This becomes an issue when there are existing `0x00` bytes in the packet before encoding. COBS has a simple solution for this though. Each `0x00` byte gets replaced with a byte that who's value is equal to the distance to the next `0x00` byte.

#image("./complex-cobs.svg", width: 80%)

This marker bytes can then be traversed to decode the encoded byte. If the length of the packet does not match up with the final marker byte, then we know the packet has been corrupted.

Here's the Loginator's decoding solution:
```rs
/// Adds a single byte for the decoder to decode.
pub fn feed(&mut self, byte: u8) -> Result<Option<Vec<u8>>, DecodeError> {
    if !self.is_parsing {
        self.pointer = byte as usize; // The first pointer is always the overhead byte.
        self.is_parsing = true;
    } else if byte == 0 {
        // If the byte being received is zero then we know that we have all of our data
        let result = self.buffer.clone();

        if !(self.buffer.len() + 1 == self.pointer) {
            self.buffer = vec![];
            return Err(DecodeError::InvalidLength);
        }

        self.buffer = vec![];
        return Ok(Some(result));
    } else if self.buffer.len() + 1 == self.pointer {
        // If the current index is pointer then the current value was originally zero, but was changed during encoding.
        // We have to add 1 to the length to account for the overhead byte.
        self.buffer.push(0);
        self.pointer = self.buffer.len() + byte as usize;
    } else {
        // If none of the other conditions are true then the data does not need to be modified at all.
        self.buffer.push(byte);
    }

    Ok(None)
}
```
Bytes are fed in one at a time. The algorithm then checks if that byte is valid based on the existing information it has. If it detects that the data is complete and uncorrupted, it returns that data.

= Verifying Telemetry

Not all data sent by the brain is telemetry. We wanted a way to have data be identifiable as telemetry. We use a simple regular expression to check if the data is actually telemetry.
```rs
let regex = Regex::new(r"TELE_DEBUG:(.*?)TELE_END").unwrap();
```

This ensures that we don't accidentally parse something else.

= Final Product

Once the MQTT integration was completed, sending data to Grafana was dead simple. All we had to do was start the Mosquitto and Grafana services locally, and then start up the Loginator. The CLI we created only needs three commands to get started.

```sh
loginator list-brains
# User must now change the name of the Brain in the config to match their brain
loginator display-code
# User must now put the code into the config file
loginator connect
# The the Loginator should now be connected, and ready to send information
```
Once the Loginator is configured, all the user needs to do is run the last command, and the Loginator will work right away.

The Brain side experience is still a little shaky. In order to send data, users are required to use LemLib. Here's an example of a packet being sent:
```cpp
#define TEMPERATURE_ROUTE 0
lemlib::telemetrySink()->debug("{},{},{}", TEMPERATURE_ROUTE, motor1.get_temperature(), motor2.get_temperature());
// Currently the loginator will only work with debug level messages
```
The data must be numerical, separated by numbers. Data in any other format will not work. We'd like to make this easier to use, but we're unsure of a better way to do it.

#figure(
  image("./loginator_pid.png", width: 60%),
  caption: "Grafana, receiving data PID from the loginator"
)

Overall we're very happy with how this turned out, and will continue to use it in the future. We hope that other teams will use it and benefit from it as well.

