{
  l,
  jsonSchema,
}: {
  new = {
    id,
    tags,
    description,
    location,
    relationships ? [],
  }:
  # jsonSchema.components.schemas.SoftwareSystem.properties
    l.kPop {
      inherit
        id
        tags
        description
        location
        relationships
        ;
    };
}
