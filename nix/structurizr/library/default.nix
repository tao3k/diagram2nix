{
  inputs,
  cell,
}: let
  inherit (inputs.cells.main.library) l __inputs__;
in {
  jsonSchema = cell.library.importYamlFromJson "${__inputs__.jsonschema}/structurizr.yaml";
}
