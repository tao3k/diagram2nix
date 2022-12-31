{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab.writers.lib) writeShellApplication;
  inherit (inputs) nixpkgs;
  inherit (inputs.cells.common.lib) __inputs__ l;
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

  yaml2dot = writeShellApplication {
    name = "yaml2dot";
    runtimeInputs = [nixpkgs.graphviz cell.packages.yaml2dot];
    text = let
      complex = (nixpkgs.formats.yaml {}).generate "complex.yaml" (l.fromJSON (l.readFile "${__inputs__.json-to-simple-graphql-schema}/test/fixtures/complex.json"));
      data = (nixpkgs.formats.yaml {}).generate "data.yaml" {
        a = "1";
        b = "2";
        c = "3";
      };
    in ''
      yml2dot ${data} | dot -Tpng > "$PRJ_ROOT"/docs/graphviz/yaml2dot.png
      yml2dot ${complex} | dot -Tpng > "$PRJ_ROOT"/docs/graphviz/yaml2dot-complex.png
    '';
  };

  graphql = writeShellApplication {
    name = "graphqlToGraphViz";
    runtimeInputs = [
      inputs.cells.graphql.packages.json-to-simple-graphql-schema
      cell.packages.craftql
      nixpkgs.jq
    ];

    text = let
      complex = (nixpkgs.formats.json {}).generate "complex.json" (l.fromJSON (l.readFile "${__inputs__.json-to-simple-graphql-schema}/test/fixtures/complex.json"));
      data = (nixpkgs.formats.json {}).generate "data.json" {
        # https://github.com/walmartlabs/json-to-simple-graphql-schema/blob/master/test/fixtures/complex.json
        "help" = "https://demo.ckan.org/api/3/action/help_show?name=package_show";
        result = {
          "id" = "beb6c3a6-098d-4389-b0a2-de0243728b42";
          "metadata_created" = "2017-07-18T13:16:28.631451";
          "metadata_modified" = "2018-11-20T15:16:40.735065";
        };
      };
    in ''
      # https://github.com/walmartlabs/json-to-simple-graphql-schema
      # https://github.com/yamafaktory/craftql
      # shellcheck disable=all
      cat ${data} | json-to-simple-graphql-schema --baseType BaseType --prefix Prefix > /tmp/output.graphql
      jq '.' ${complex} | json-to-simple-graphql-schema --baseType BaseType --prefix "" > /tmp/complex.graphql
      craftql /tmp/complex.graphql > "$PRJ_ROOT"/docs/graphviz/complex.graphviz
    '';
  };
}
