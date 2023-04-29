{
  l,
  jsonSchema,
  inputs,
  cell,
}: let
  default = l.mapAttrs (_: v: v.type) cell.lib.jsonSchema.components.schemas.ElementView.properties;
in {
  new = {
    id ? "1",
    x ? 0,
    y ? 0,
  }:
    l.pop.kPop (default
      // {
        inherit id x y;
      });
}
