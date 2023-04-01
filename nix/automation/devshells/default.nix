{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
in
  l.mapAttrs (_: std.lib.dev.mkShell) {
    default = {...}: {
      name = "diagram2nix";
      imports = [
        inputs.std-ext.automation.devshellProfiles.default
      ];

      nixago = [
        inputs.std-ext.automation.nixago.treefmt
        cell.nixago.mdbook
      ];
      commands = [
        {
          package = inputs.cells.structurizr.packages.structurizr-cli;
        }
        {
          package = inputs.cells.graphviz.packages.craftql;
        }
        {
          name = "nvfetcher-update";
          command = ''
            nix develop github:GTrunSec/std-ext#devShells.x86_64-linux.update \
            --refresh --command \
            nvfetcher-update "$@"
          '';
          help = "Update nix/main/packages/sources.toml";
        }
      ];
    };
    doc = {...}: {
      name = "diagram2nix-doc";
      nixago = [cell.nixago.mdbook];
    };
  }
