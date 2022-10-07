{
  inputs,
  cell,
}: {
  simple = cell.lib.json2plantuml {
    name = "simple";
    config = {
      a = "b";
      c = "d";
    };
  };
}
