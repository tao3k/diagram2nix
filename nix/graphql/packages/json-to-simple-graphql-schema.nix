{
  __inputs__,
  nixpkgs,
}: let
  inherit (__inputs__) dream2nix json-to-simple-graphql-schema;
in
  ((dream2nix.lib.makeFlakeOutputs {
      systems = [nixpkgs.system];
      config.projectRoot = ./.;
      source = json-to-simple-graphql-schema;
    })
    .packages
    ."${nixpkgs.system}"
    .default)
  // {
    meta = {
      homepage = "https://github.com/walmartlabs/json-to-simple-graphql-schema";
      description = "A simple GraphQL schema generator from JSON";
    };
  }
