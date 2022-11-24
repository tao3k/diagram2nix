{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) l __inputs__ importYamlFromJson;
in {
  jsonSchema = importYamlFromJson "${__inputs__.jsonschema}/structurizr.yaml";
  writeStructurizDSL = attr: (import ./writeStructurizDSL.nix {inherit l inputs;}) attr;
}
