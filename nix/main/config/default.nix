{
  inputs,
  cell,
}: let
  inherit (inputs) jsonschema;
in {
  jsonSchema = cell.library.importYamlFromJson "${jsonschema}/structurizr.yaml";
}
