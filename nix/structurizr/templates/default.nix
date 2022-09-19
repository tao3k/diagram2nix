{
  inputs,
  cell,
}: let
  inherit (cell) config library;
  inherit (library) l __inputs__;
in {
  model =
    (
      ((config.model.new {}).addSoftwareSystem {
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

  people = (config.people.new {}).__unpop__;

  relationships = (config.relationships.new {}).__unpop__;

  ElementStyle = (config.ElementStyle.new {}).__unpop__;

  ElementView = (config.ElementView.new {}).__unpop__;
}
