{
  inputs = {
    cells-lab.url = "github:GTrunSec/cells-lab";
    # follows
    nixpkgs.follows = "cells-lab/nixpkgs";
    nixpkgs-lock.follows = "cells-lab/nixpkgs";
    std.follows = "cells-lab/std";
  };

  inputs = {
    POP.url = "github:divnix/POP/visibility";
  };

  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = [
        (std.blockTypes.installables "packages")

        (std.blockTypes.functions "devshellProfiles")

        (std.blockTypes.devshells "devshells")

        (std.blockTypes.runnables "entrypoints")

        (std.blockTypes.functions "library")

        (std.blockTypes.functions "config")

        (std.blockTypes.data "tests")
        (std.blockTypes.data "examples")

        (std.blockTypes.functions "packages")

        (std.blockTypes.functions "overlays")

        (std.blockTypes.nixago "nixago")
      ];
    } {
      devShells = inputs.std.harvest inputs.self ["main" "devshells"];
      packages = inputs.std.harvest inputs.self ["main" "packages"];
    };
}
