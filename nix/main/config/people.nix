{
  l,
  jsonSchema,
  inputs,
  cell,
}: let
  relationships' = (cell.config.relationships {}).__unpop__;
  description' = jsonSchema.components.schemas.Person.properties.description.description;
  name' = jsonSchema.components.schemas.Person.properties.name.description;
in
  {
    description ? description',
    name ? name',
    id ? 1,
    tags ? ["foo" "bar"],
    location ? "Internal",
    defaultTags ? ["foo" "bar"],
    relationships ? relationships',
  }: let
    tags' = l.concatStringsSep "," tags;
  in
    l.kPop ({
        inherit description;
      }
      // {
        inherit id tags' name location defaultTags;
        inherit relationships;
      })
