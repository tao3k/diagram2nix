{
  l,
  jsonSchema,
}: {
  new = {
    id ? 1,
    tags ? "Relationship",
    sourceId ? 1,
    destinationId ? 2,
    description ? "A relationship between two entities",
    defaultTags ? ["Relationship"],
  }:
    l.pop.kPop {
      inherit id tags sourceId destinationId description defaultTags;
    };
}
