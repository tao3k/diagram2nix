{
  inputs,
  cell,
}: let
  inherit (cell) config library;
  inherit (library) l __inputs__;
in {
  model = (config.model.new {}).__unpop__;

  people = (config.people.new {}).__unpop__;

  relationships = (config.relationships.new {}).__unpop__;

  ElementStyle = (config.ElementStyle.new {}).__unpop__;

  ElementView = (config.ElementView.new {}).__unpop__;

  big-bank-plc = l.fromJSON (l.readFile (__inputs__.example + "/json/big-bank-plc/workspace.json"));
}
