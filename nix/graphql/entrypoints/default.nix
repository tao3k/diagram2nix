{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab._writers.lib) writeShellApplication;
  inherit (inputs) nixpkgs;
in {}
