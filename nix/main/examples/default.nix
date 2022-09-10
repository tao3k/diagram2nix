{
  inputs,
  cell,
}: let
  inherit (cell) config library;
  inherit (library) l __inputs__;
in {
  big-bank-plc = l.fromJSON (l.readFile (__inputs__.example + "/json/big-bank-plc/workspace.json"));
}
