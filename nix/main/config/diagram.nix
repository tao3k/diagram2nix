{
  l,
  jsonSchema,
  inputs,
  cell,
}: {
  new = {
    configuration ? {},
    model ? {},
    documentation ? {},
    description ? "",
    lastModifiedDate ? "now",
    name ? "Untitled",
    views ? [],
  }:
    l.pop {
      visibility = {
        _models = false;
        addModel = false;
        addModels = false;
        addView = false;
        addViews = false;
      };
    };
}
