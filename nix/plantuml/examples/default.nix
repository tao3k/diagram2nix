{
  inputs,
  cell,
}: {
  simple = cell.library.json2plantuml {
    name = "simple";
    config = {
      a = "b";
      c = "d";
    };
  };
}
