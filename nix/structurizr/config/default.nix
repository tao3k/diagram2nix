{
  inputs,
  cell,
} @ args: let
  inherit (inputs.cells.main.lib) l;
  inherit (cell.lib) jsonSchema;
  args' = args // {inherit l jsonSchema;};
in {
  systemContextView = import ./systemContextView.nix {inherit jsonSchema l;};
  # softwareSystems = import ./softwareSystems.nix {inherit jsonSchema l;};

  softwareSystem = import ./softwareSystem.nix {inherit jsonSchema l;};

  person = import ./person.nix args';

  relationships = import ./relationships.nix {inherit jsonSchema l;};

  diagram = import ./diagram.nix args';

  documentation = import ./documentation.nix args';
  views = import ./views.nix args';
  configuration = import ./configuration.nix args';

  ElementStyle = import ./ElementStyle.nix args';
  ElementView = import ./ElementView.nix args';
}
