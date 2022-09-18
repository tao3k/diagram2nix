{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs POP std self;
  inherit (inputs.cells-lab.main.library) callFlake;

  l = nixpkgs.lib // builtins // (POP.lib);

  __inputs__ = callFlake "${(std.incl self [(self + /lock)])}/lock" {
    nixpkgs.locked = inputs.nixpkgs-lock.sourceInfo;
    dream2nix.inputs.nixpkgs = "nixpkgs";
  };
in {
  inherit l __inputs__;

  importYamlFromJson = f: let
    name = l.last (l.splitString "/" f);
    toJsonFile = nixpkgs.runCommand name {preferLocalBuild = true;} ''
      ${nixpkgs.remarshal}/bin/yaml2json  -i ${f} -o $out
    '';
  in
    l.importJSON toJsonFile;
}
