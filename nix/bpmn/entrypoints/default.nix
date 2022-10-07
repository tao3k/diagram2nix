{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab._writers.lib) writeShellApplication;
  inherit (inputs.cells.main.lib) __inputs__ l;

  nixpkgs = inputs.nixpkgs.appendOverlays [
    __inputs__.poetry2nix.overlay
  ];
in {
  # does not work
  json2xml = let
    data = (nixpkgs.formats.json {}).generate "data.json" {
      a = "1";
      b = "2";
      c = "3";
    };
    script = nixpkgs.writeText "script.py" ''
      from json2xml import json2xml
      from json2xml.utils import readfromjson
      data = readfromjson("${data}"
      print(json2xml.Json2xml(data).to_xml())
    '';
  in
    writeShellApplication {
      name = "json2xml";
      runtimeInputs = [inputs.cells.main.packages.json2xml];
      text = ''
        python ${script} > json2xml.xml
      '';
    };
}
