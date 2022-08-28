{
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };

  # inputs = {
  #   main.url = "../.";
  #   nixpkgs.follows = "main/nixpkgs";
  # };

  inputs = {
    jsonschema.url = "github:structurizr/json";
    jsonschema.flake = false;

    example.url = "github:structurizr/examples";
    example.flake = false;
  };

  outputs = {self, ...}: {};
}
