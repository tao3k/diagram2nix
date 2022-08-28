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
    l.kPop {
      inherit branding styles;
    };
}
