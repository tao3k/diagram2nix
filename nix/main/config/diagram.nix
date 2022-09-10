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
        _annotations = false;
        required = false;
        inputs = false;
        templates = false;
        panels = false;
        addAnnotation = false;
        addAnnotations = false;
        addTemplates = false;
        addTemplate = false;
      };
    };
}
