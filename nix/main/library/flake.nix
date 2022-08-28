{
  inputs = {
    jsonschema.url = "github:structurizr/json";
    jsonschema.flake = false;

    example.url = "github:structurizr/examples";
    example.flake = false;
  };

  outputs = {self, ...}: {};
}
