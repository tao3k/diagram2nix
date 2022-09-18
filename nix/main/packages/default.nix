{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  bafi = let
    sources = nixpkgs.callPackage ./_sources/generated.nix {};
  in
    nixpkgs.callPackage ./bafi.nix {inherit sources;};
}
