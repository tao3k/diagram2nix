{
  inputs,
  cell,
}: let
  inherit (cell) config lib;
  inherit (inputs.cells.main.lib) l __inputs__;
in {
  diagram =
    (
      ((config.diagram.new {}).addSoftwareSystem {
        id = "1";
        tags = ["System" "Element System"];
      })
      .addSoftwareSystems [
        (cell.config.softwareSystem.new {
          id = "2";
          tags = ["Element System"];
        })
      ]
    )
    .__unpop__;

  relationships = (config.relationships.new {}).__unpop__;

  ElementStyle = (config.ElementStyle.new {}).__unpop__;

  ElementView = (config.ElementView.new {}).__unpop__;

  a =
    l.kxPop (cell.config.softwareSystem.new {
      id = "2";
      tags = ["Element System"];
    }) {
      b = "s";
    };
}
