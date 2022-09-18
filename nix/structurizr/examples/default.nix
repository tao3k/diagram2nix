{
  inputs,
  cell,
}: let
  inherit (inputs.cells.main.library) library;
  inherit (library) l __inputs__;
in {
  big-bank-plc = l.fromJSON (l.readFile (__inputs__.example + "/json/big-bank-plc/workspace.json"));
  adds = import ./adds.nix {lib = l;};
}
