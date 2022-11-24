{
  inputs,
  cell,
}: let
  inherit (cell.lib) __inputs__;
  nixpkgs = inputs.nixpkgs.appendOverlays [
    __inputs__.poetry2nix.overlay
  ];
in
  {
    json2xml = nixpkgs.poetry2nix.mkPoetryEnv {
      projectDir = ./json2xml;
    };
    bafi = let
      sources = nixpkgs.callPackage ./_sources/generated.nix {};
    in
      nixpkgs.callPackage ./bafi.nix {inherit sources;};
  }
  // inputs.cells.graphviz.packages
  // inputs.cells.graphql.packages
  // inputs.cells.structurizr.packages
