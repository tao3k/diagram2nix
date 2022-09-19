{
  inputs,
  cell,
} @ args: let
  inherit (inputs.cells.main.library) l;
  inherit (cell.library) jsonSchema;
  args' = args // {inherit l jsonSchema;};
in {
  systemContextView = import ./systemContextView.nix {inherit jsonSchema l;};
  # softwareSystems = import ./softwareSystems.nix {inherit jsonSchema l;};

  softwareSystem = import ./softwareSystem.nix {inherit jsonSchema l;};

  model = import ./model.nix args';

  people = import ./people.nix args';

  relationships = import ./relationships.nix {inherit jsonSchema l;};

  diagram = import ./diagram.nix args';

  documentation = import ./documentation.nix args';
  views = import ./views.nix args';
  configuration = import ./configuration.nix args';

  ElementStyle = import ./ElementStyle.nix args';
  ElementView = import ./ElementView.nix args';
}
