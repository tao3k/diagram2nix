{
  inputs,
  cell,
}: let
  inherit (inputs.cells.main.lib) __inputs__ l;
  inherit (inputs) nixpkgs;
in {
  default = {};
}
