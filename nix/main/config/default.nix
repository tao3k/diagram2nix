{
  inputs,
  cell,
}: let
  inherit (cell.library) l jsonSchema;
in {
  systemContextView = import ./systemContextView.nix {inherit jsonSchema l;};
  softwareSystems = import ./softwareSystems.nix {inherit jsonSchema l;};
  model = import ./model.nix {inherit jsonSchema l;};
}
