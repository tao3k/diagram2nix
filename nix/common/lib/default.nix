{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs POP std self;
  inherit (inputs.std-ext.common.lib) callFlake;

  l = nixpkgs.lib // builtins // (POP.lib) // (import ./extend.nix {inherit l;});

  __inputs__ = callFlake ./lock {
    dream2nix.inputs.nixpkgs = "nixpkgs";
  };
in {
  inherit __inputs__;

  importYamlFromJson = f: let
    name = l.last (l.splitString "/" f);
    toJsonFile = nixpkgs.runCommand name {preferLocalBuild = true;} ''
      ${nixpkgs.remarshal}/bin/yaml2json  -i ${f} -o $out
    '';
  in
    l.importJSON toJsonFile;
}
