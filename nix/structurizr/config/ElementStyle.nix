{
  l,
  jsonSchema,
  inputs,
  cell,
}: let
  default = l.mapAttrs (_: v: v.type) cell.lib.jsonSchema.components.schemas.ElementStyle.properties;
in {
  new = {...}:
    l.kPop (default
      // {
      });
}
