{
  inputs = {
    jsonschema.url = "github:structurizr/json";
    jsonschema.flake = false;

    example.url = "github:structurizr/examples";
    example.flake = false;

    dream2nix.url = "github:nix-community/dream2nix";

    json-to-simple-graphql-schema.url = "github:walmartlabs/json-to-simple-graphql-schema";
    json-to-simple-graphql-schema.flake = false;

    craftql.url = "github:yamafaktory/craftql";
    craftql.flake = false;
  };

  outputs = {self, ...}: {};
}
