{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab._writers.library) writeShellApplication;
  inherit (inputs) nixpkgs;
in {}
