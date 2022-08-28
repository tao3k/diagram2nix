{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs POP std self;
  l = nixpkgs.lib // builtins // (POP.lib);

  __inputs__ = let
    inputs' = (import "${(std.incl self [(self + /lock)])}/lock").inputs;
  in
    (std.deSystemize nixpkgs.system inputs') // inputs;
in {
  inherit l __inputs__;

  importYamlFromJson = f: let
    name = l.last (l.splitString "/" f);
    toJsonFile = nixpkgs.runCommand name {preferLocalBuild = true;} ''
      ${nixpkgs.remarshal}/bin/yaml2json  -i ${f} -o $out
    '';
  in
    l.importJSON toJsonFile;

  jsonSchema = cell.library.importYamlFromJson "${__inputs__.jsonschema}/structurizr.yaml";
}
