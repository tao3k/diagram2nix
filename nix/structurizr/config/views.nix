{
  l,
  jsonSchema,
  inputs,
  cell,
}: {
  new = {
    component ? [],
    configuration ? {},
    container ? {},
    custom ? [],
    deploymentView ? [],
    dynamic ? [],
    filtered ? [],
    systemContextView ? [],
    systemLandscapeView ? [],
  }:
    l.pop.kPop {
      inherit
        component
        configuration
        container
        custom
        deploymentView
        dynamic
        filtered
        systemContextView
        systemLandscapeView
        ;

      theme = "default";
      /*

      autoLayout: https://github.com/structurizr/dsl/blob/master/docs/language-reference.md#autolayout
                  [tb|bt|lr|rl]
      */
    }
    // l.optionalAttrs (container != {}) {
      # container = {
      #   softwareSystem = {
      #     include = "*";
      #     autoLayout = "lr";
      #   };
      # };
      container = container;
    }
    // {
      extensions = self: super: {
        addSystemContext = {};
        addContainer = {};
      };
    };
}
