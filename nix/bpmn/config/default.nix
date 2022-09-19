{inputs, cell}: let
  inherit (inputs.cells.main.library) __inputs__ l;
  inherit (inputs) nixpkgs;
in {
  default =  {};
}
