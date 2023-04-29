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
    l.pop.kPop {
      inherit sections images decisions;
    };
}
