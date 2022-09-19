{
  l,
  jsonSchema,
  inputs,
  cell,
}: {
  new = {...}:
    l.pop {
      # make __unpop__ recursive
      supers = [l.recursiveUnpop];

      visibility = {
        addSoftwareSystem = false;
        addSoftwareSystems = false;
      };

      extension = self: super: {
        softwareSystems = [];

        addSoftwareSystem = softwareSystem:
          l.extendPop self (self: super: let
            softwareSystem' =
              if l.hasAttr "tags" softwareSystem
              then softwareSystem // {tags = l.concatStringsSep "," softwareSystem.tags;}
              else softwareSystem;
          in {
            softwareSystems = super.softwareSystems ++ [softwareSystem'];
          });
        addSoftwareSystems = softwareSystems:
          l.foldl (p: t: p.addSoftwareSystem t) self softwareSystems;
      };
    };
}
