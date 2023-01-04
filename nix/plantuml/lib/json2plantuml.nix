{
  inputs,
  cell,
}: {
  name ? "json2plantuml.plum",
  config,
}: let
  inherit (inputs) nixpkgs;
  l = inputs.nixpkgs.lib // builtins;
in
  nixpkgs.writeText name ''
    @startjson
    ${l.fileContents ((nixpkgs.formats.json {}).generate "data.json" config)}
    @endjson
  ''
