{
  inputs,
  cell,
}: let
  inherit (inputs.cells.main.library) l __inputs__ importYamlFromJson;
in {
  jsonSchema = importYamlFromJson "${__inputs__.jsonschema}/structurizr.yaml";
}
