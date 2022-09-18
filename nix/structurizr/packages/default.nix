{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  structurizr-cli = let
    structurizr-sources = nixpkgs.callPackage ./_sources/generated.nix {};
  in
    nixpkgs.callPackage ./cli.nix {inherit structurizr-sources;};
}
