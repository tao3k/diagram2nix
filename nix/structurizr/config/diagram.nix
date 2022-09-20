{
  l,
  jsonSchema,
  inputs,
  cell,
}: {
  new = {
    configuration ? {},
    model ? {},
    documentation ? {},
    styles ? {},
    description ? "",
    lastModifiedDate ? "now",
    name ? "Untitled",
    views ? [],
  }:
    l.pop {
      # make __unpop__ recursive
      supers = [l.recursiveUnpop];

      visibility = {
        addSoftwareSystem = false;
        addSoftwareSystems = false;
      };

      extension = self: super: {
        model.softwareSystems = [];

        addSoftwareSystem = softwareSystem:
          l.extendPop self (self: super: let
            softwareSystem' =
              if l.hasAttr "tags" softwareSystem
              then softwareSystem // {tags = l.concatStringsSep "," softwareSystem.tags;}
              else softwareSystem;
          in {
            model.softwareSystems = super.model.softwareSystems ++ [softwareSystem'];
          });
        addSoftwareSystems = softwareSystems:
          l.foldl (p: t: p.addSoftwareSystem t) self softwareSystems;
      };
    };
}
