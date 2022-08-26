{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs POP;
  l = nixpkgs.lib // builtins // (POP.lib);
in {
  inherit l;

  importYamlFromJson = f: let
    name = l.last (l.splitString "/" f);
    toJsonFile = nixpkgs.runCommand name {preferLocalBuild = true;} ''
      ${nixpkgs.remarshal}/bin/yaml2json  -i ${f} -o $out
    '';
  in
    l.importJSON toJsonFile;
}
