{
  inputs,
  cell,
}: let
  inherit (cell) config lib;
  inherit (inputs.cells.common.lib) __inputs__ l;
in rec {
  diagram = (
    ((config.diagram.new {}).addSoftwareSystem {
      id = "1";
      tags = ["System" "Element System"];
    })
    .addSoftwareSystems [
      (cell.config.softwareSystem.new {
        id = "2";
        tags = ["Element System"];
      })
    ]
  );

  relationships = config.relationships.new {};

  ElementStyle = config.ElementStyle.new {};

  ElementView = config.ElementView.new {};

  a =
    l.pop.kxPop (cell.config.softwareSystem.new {
      id = "2";
      tags = ["Element System"];
    }) {
      extensions = _: _: {
        a = "s";
      };
    };

  c = l.functionArgs ({c ? "1", ...}: {
    d = "s";
  });

  nixosPop = with l.pop; (pop {
    supers = [];
    addConfig = {};
    addConfigs = {};

  });

  test = args:
    with l.pop; (kPop (({config, ...}: {
        test = {
          a = "s";
        };
      })
      args));

  eval = l.evalModules {
    specialArgs = {};
    modules = with inputs.nixpkgs.lib; l.flatten [
      {
        options.test = l.mkOption {
          default = {};
          type = types.attrs;
        };
      }
      ({lib, ...} @ args: {
        imports = [
          (l.pop.unpop (test args))
        ];
      })
    ];
  };
}
