{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab._writers.lib) writeShellApplication;
  inherit (cell.lib) __inputs__ l;
  inherit (inputs) nixpkgs;
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
    data = (nixpkgs.formats.json {}).generate "data.json" ({
      }
      // (l.fromJSON (l.readFile ./json2xml.json)));
    script = nixpkgs.writeText "script.py" ''
      from json2xml import json2xml
      from json2xml.utils import readfromjson
      data = readfromjson("${data}")
      print(json2xml.Json2xml(data).to_xml())
    '';
  in
    writeShellApplication {
      name = "json2xml";
      runtimeInputs = [cell.packages.json2xml];
      text = ''
        echo "${data}"
        python ${script} > "$PRJ_ROOT"/docs/BPMN/json2xml.xml
      '';
    };
}
