{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
in
  l.mapAttrs (_: std.std.lib.mkShell) {
    default = {...}: {
      name = "diagram2nix";
      imports = [
        inputs.cells-lab.main.devshellProfiles.default
      ];

      nixago = [] ++ l.attrValues cell.nixago;
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
            nix develop github:GTrunSec/cells-lab#devShells.x86_64-linux.update \
            --refresh --command \
            nvfetcher-update nix/main/packages/sources.toml
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
