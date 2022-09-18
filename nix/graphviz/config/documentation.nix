{
  l,
  jsonSchema,
  inputs,
  cell,
}: {
  new = {
    sections ? [],
    images ? [],
    decisions ? [],
  }:
    l.kPop {
      inherit sections images decisions;
    };
}
