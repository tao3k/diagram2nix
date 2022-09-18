{
  __inputs__,
  nixpkgs,
}: let
  inherit (__inputs__) dream2nix craftql;
in
  (dream2nix.lib.makeFlakeOutputs {
    systems = [nixpkgs.system];
    config.projectRoot = ./.;
    config.disableIfdWarning = true;
    source = craftql;
    settings = [
      {
        builder = "crane";
        translator = "cargo-lock";
      }
    ];
  })
  .packages
  ."${nixpkgs.system}"
  .default
