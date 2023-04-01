{
  inputs,
  cell,
}: let
  inherit (inputs) std;
in {
  mdbook = std.presets.nixago.mdbook {
    data = {
      book.title = "diagram2nix";
    };
  };
}
