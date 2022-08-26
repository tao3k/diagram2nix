{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    cells-lab.url = "github:GTrunSec/cells-lab";

    std.follows = "cells-lab/std";

    POP.url = "github:divnix/POP/visibility";
  };

  inputs = {
    jsonschema.url = "github:structurizr/json";
    jsonschema.flake = false;
  };

  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;
      organelles = [
        (std.installables "packages")

        (std.functions "devshellProfiles")
        (std.devshells "devshells")

        (std.runnables "entrypoints")

        (std.functions "library")

        (std.data "config")

        (std.functions "packages")

        (std.functions "overlays")

        (std.nixago "nixago")
      ];
    } {
      devShells = inputs.std.harvest inputs.self ["main" "devshells"];
      packages = inputs.std.harvest inputs.self ["main" "packages"];
    };
}
