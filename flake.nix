{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    typst.url = "github:typst/typst/main";
    typstfmt.url = "github:astrale-sharp/typstfmt/0.2.7";

    typst.inputs.nixpkgs.follows = "nixpkgs";
    typstfmt.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self
    , nixpkgs
    , utils
    , typst
    , typstfmt
    ,
    }:
    utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell = pkgs.mkShell {
        packages = [
          pkgs.typst
          #typst.packages.${system}.default
          pkgs.typst-lsp
          typstfmt.packages.${system}.default
          #pkgs.nodePackages_latest.mermaid-cli
          pkgs.act
          pkgs.typos
          pkgs.just
          pkgs.nodePackages_latest.prettier
        ];
      };

    });
}
