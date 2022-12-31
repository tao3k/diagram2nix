{
  __inputs__,
  inputs,
}: let
  nixpkgs = inputs.nixpkgs.appendOverlays [
    (final: prev: {crane = __inputs__.crane.mkLib final;})
  ];
  craneLib = nixpkgs.crane.overrideScope' (final: prev: {});
in
  craneLib.buildPackage {
    src = __inputs__.craftql;
    pname = "craftql";
    doCheck = false;
  }
