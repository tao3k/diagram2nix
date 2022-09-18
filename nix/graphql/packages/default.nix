{
  inputs,
  cell,
}: let
  inherit (inputs.cells.main.library) __inputs__;
  inherit (inputs) nixpkgs;
in {
  json-to-simple-graphql-schema = nixpkgs.callPackage ./json-to-simple-graphql-schema.nix {inherit __inputs__ nixpkgs;};
}
