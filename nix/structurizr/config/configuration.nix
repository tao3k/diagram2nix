{
  l,
  jsonSchema,
  inputs,
  cell,
}: {
  new = {
    branding ? {},
    styles ? {},
  }:
    l.pop.kPop {
      inherit branding styles;
    };
}
