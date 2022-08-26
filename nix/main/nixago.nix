{
  inputs,
  cell,
}: let
  inherit (inputs) std;
in {
  treefmt = std.std.nixago.treefmt {
    configData.formatter.nix = {
      excludes = [
        "generated.nix"
      ];
    };
    configData.formatter.prettier = {
      excludes = [
        "conf/schemas/*"
      ];
    };
  };

  mdbook = std.std.nixago.mdbook {
    configData = {
      book.title = "structurizr2nix";
    };
  };
}
