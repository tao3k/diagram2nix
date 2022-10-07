{
  inputs,
  cell,
}: let
  inherit (inputs.cells.main) lib;
  inherit (lib) l __inputs__;
in {
  big-bank-plc = l.fromJSON (l.readFile (__inputs__.example + "/json/big-bank-plc/workspace.json"));
  gen = cell.lib.writeStructurizDSL {
    name = "";
    description = "";
  };
}
