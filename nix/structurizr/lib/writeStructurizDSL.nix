{
  l,
  inputs,
}: attrset: let
  inherit (inputs) nixpkgs;
in
  nixpkgs.writeText "structurizr.dsl" ''
    workspace ${attrset.name} ${attrset.description} {
        model {
        }
        views {
        }
      }
  ''
