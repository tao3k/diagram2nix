{
  inputs,
  cell,
} @ args: {
  json2plantuml = attrset: (import ./json2plantuml.nix args attrset);
}
