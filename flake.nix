{
  inputs = {
    std-ext.url = "github:GTrunSec/std-ext";
    # follows
    nixpkgs.follows = "std-ext/nixpkgs";
    std.follows = "std-ext/std";
  };

  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;

      cellsFrom = ./nix;

      cellBlocks = with std.blockTypes; [
        (installables "packages")

        (functions "devshellProfiles")

        (devshells "devshells")

        (runnables "entrypoints")

        (functions "lib")

        (functions "config")

        (data "templates")

        (files "examples")

        (functions "packages")

        (functions "overlays")

        (nixago "nixago")
      ];
    } {
      devShells = inputs.std.harvest inputs.self ["automation" "devshells"];
      packages = inputs.std.harvest inputs.self ["common" "packages"];
    };
}
