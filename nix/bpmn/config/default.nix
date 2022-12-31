{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
  inherit (inputs) nixpkgs;
  l = inputs.nixpkgs.lib // builtins;
in {
  default = l;
}
