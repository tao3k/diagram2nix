{
  inputs = {
    cells-lab.url = "github:GTrunSec/cells-lab";
    # follows
    nixpkgs.follows = "cells-lab/nixpkgs";
    std.follows = "cells-lab/std";
  };

  inputs = {
    POP.url = "github:divnix/POP/visibility";
  };

  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;

      cellsFrom = ./nix;

      cellBlocks = with std.blockTypes;[
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
