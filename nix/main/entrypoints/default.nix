{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab._writers.library) writeShellApplication;
  inherit (cell.library) __inputs__ l;
  nixpkgs = inputs.nixpkgs.appendOverlays [
    __inputs__.poetry2nix.overlay
  ];
in {
  update = writeShellApplication {
    name = "update";
    runtimeInputs = [];
    text = ''
      nix develop github:GTrunSec/cells-lab#devShells.x86_64-linux.update \
      --refresh --command \
      nvfetcher-update nix/main/packages/sources.toml
    '';
  };
  json2xml = let
    python = nixpkgs.poetry2nix.mkPoetryEnv {
      projectDir = ./json2xml;
    };
    data = (nixpkgs.formats.json {}).generate "data.json" {
      a = "1";
      b = "2";
      c = "3";
    };
    script = nixpkgs.writeText "script.py" ''
    from json2xml import json2xml
    from json2xml.utils import readfromjson
    data = readfromjson("${data}")
    print(json2xml.Json2xml(data).to_xml())
    '';
  in
    writeShellApplication {
      name = "json2xml";
      runtimeInputs = [python];
      text = ''
        python ${script} > json2xml.xml
      '';
    };
}
