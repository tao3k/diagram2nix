{inputs, cell}: let
  inherit (inputs.cells.main.library) __inputs__ l;
  inherit (inputs) nixpkgs;
in {
  default = (nixpkgs.formats.ini {listsAsDuplicateKeys = true; }).generate "data.int" {
    b = {a = "2";};
  };
}
