{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
in
  l.mapAttrs (_: std.std.lib.mkShell) {
    default = {...}: {
      name = "default: Cells Lab Tempalte";
      imports = [
        inputs.cells-lab.main.devshellProfiles.default
      ];
      nixago = [] ++ l.attrValues cell.nixago;
      commands = [
        {
          name = "nvfetcher-update";
          command = ''
            nix develop github:GTrunSec/cells-lab#devShells.x86_64-linux.update \
            --refresh --command \
            nvfetcher-update nix/main/packages/sources.toml
          '';
        }
      ];
    };
  }