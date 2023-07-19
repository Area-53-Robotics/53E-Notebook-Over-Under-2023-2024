{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShell = pkgs.mkShell {
        packages = with pkgs; [
          typst
        ];
      };

      packages.default = with pkgs;
        stdenv.mkDerivation {
          name = "notebook";
          postConfigurePhase = ''
            mkdir -p src/fonts
            ln -s ${font-awesome}/share/fonts/opentype/* src/fonts/
            ln -s ${roboto}/share/fonts/truetype/* src/fonts/
            ln -s ${source-sans-pro}/share/fonts/truetype/* src/fonts/
            ln -s ${jetbrains-mono}/share/fonts/truetype/* src/fonts/
            ln -s ${nerdfonts.override {fonts = ["JetBrainsMono"];}}/share/fonts/truetype/* src/fonts/
          '';

          buildCommand = ''
            mkdir $out
            #${typst}/bin/typst --font-path "${self}/src/fonts" compile ${self}/main.typ $out/main.pdf
            ${typst}/bin/typst --font-path "${nerdfonts.override {fonts = ["JetBrainsMono"];}}/share/fonts/truetype/"  compile ${self}/main.typ $out/main.pdf
          '';
        };
    });
}
