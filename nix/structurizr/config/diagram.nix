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
    with l.pop;
      pop {
        # make __unpop__ recursive
        supers = [];

        extension = self: super: {
          # person is a function that takes a person and returns a new people list
          model.people = [];
          addPerson = person:
            extendPop self (self: super: {
              model.people = super.model.people ++ [person];
            });
          addPeople = people:
            l.foldl (p: t: p.addPerson t) self people;

          # softwareSystem is a function that takes a softwareSystem and returns a new softwareSystems list
          model.softwareSystems = [];

          addSoftwareSystem = softwareSystem:
            extendPop self (self: super: let
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
