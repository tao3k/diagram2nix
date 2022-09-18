{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells.main.library) __inputs__;
in {
  yaml2dot = let
    sources = nixpkgs.callPackage ./_sources/generated.nix {};
  in
    nixpkgs.callPackage ./yaml2dot.nix {inherit sources;};

  craftql = nixpkgs.callPackage ./craftql.nix { inherit nixpkgs __inputs__; };
}