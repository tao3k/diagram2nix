{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab._writers.library) writeShellApplication;
  inherit (inputs) nixpkgs;
in {
  update = writeShellApplication {
    name = "update";
    runtimeInputs = [];
    text = ''
      nix develop github:GTrunSec/cells-lab#devShells.x86_64-linux.update \
      --refresh --command \
      nvfetcher-update nix/dot/packages/sources.toml
    '';
  };

  test = writeShellApplication {
    name = "test";
    runtimeInputs = [nixpkgs.graphviz cell.packages.yaml2dot];
    text = let
      data = (nixpkgs.formats.yaml {}).generate "data.yaml" {
        a = "1";
        b = "2";
        c = "3";
      };
    in ''
      yml2dot ${data} | dot -Tpng > output.png
    '';
  };
}
