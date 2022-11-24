{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__ l;
  inherit (inputs) nixpkgs;
in {
  default = {};
}
