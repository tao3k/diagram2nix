{
  l,
  jsonSchema,
}: {
  new = {
    id,
    tags ? [],
    description ? "",
    location ? [],
    relationships ? [],
  }:
  # jsonSchema.components.schemas.SoftwareSystem.properties
    l.kPop {
      inherit
        id
        description
        location
        relationships
        ;
      tags = l.concatStringsSep "," tags;

      extensions = self: super: {
        addContainer = container: {
          /*
          container = {
            description = container.description;
            technology = container.technology;
            relationships = {
              user.this = "system";
            }
          };
          */
          containers = l.concatLists [self.containers [container]];
        };
      };
    };
}
