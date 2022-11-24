{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/83658b28fe638a170a19b8933aa008b30640fbd1";

    jsonschema.url = "github:structurizr/json";
    jsonschema.flake = false;

    example.url = "github:structurizr/examples";
    example.flake = false;

    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";

    json-to-simple-graphql-schema.url = "github:walmartlabs/json-to-simple-graphql-schema";
    json-to-simple-graphql-schema.flake = false;

    craftql.url = "github:yamafaktory/craftql";
    craftql.flake = false;

    poetry2nix.url = "github:nix-community/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, ...}: {};
}
