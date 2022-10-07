{
  inputs,
  cell,
}: {
  name ? "json2plantuml.plum",
  config,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells.main.lib) l;
in
  nixpkgs.writeText name ''
    @startjson
    ${l.fileContents ((nixpkgs.formats.json {}).generate "data.json" config)}
    @endjson
  ''
