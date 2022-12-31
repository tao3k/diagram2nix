{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.common) lib;
  inherit (lib) __inputs__;
in {
  big-bank-plc = l.fromJSON (l.readFile (__inputs__.example + "/json/big-bank-plc/workspace.json"));
  gen = cell.lib.writeStructurizDSL {
    name = "";
    description = "";
  };
}
