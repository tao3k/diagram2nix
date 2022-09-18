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
    styles ? {},
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

      /*
      * This is the main function that will be called when the cell is executed.
      */
      model = {};
      views = {};
      sytles = {};
    };
}
