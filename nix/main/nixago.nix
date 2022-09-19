{
  inputs,
  cell,
}: let
  inherit (inputs) std;
in {
  treefmt = std.presets.nixago.treefmt {
    configData.formatter.nix = {
      excludes = [
        "generated.nix"
        "adds.nix"
      ];
    };
    configData.formatter.prettier = {
      excludes = [
        "conf/schemas/*"
      ];
    };
  };

  mdbook = std.presets.nixago.mdbook {
    configData = {
      book.title = "structurizr2nix";
    };
  };
}
