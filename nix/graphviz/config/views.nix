{
  l,
  jsonSchema,
  inputs,
  cell,
}: {
  new = {
    componentViews ? [],
    configuration ? {},
    containerViews ? [],
    customViews ? [],
    deploymentView ? [],
    dynamicViews ? [],
    filteredViews ? [],
    systemContextView ? [],
    systemLandscapeView ? [],
  }:
    l.kPop {
      inherit
        componentViews
        configuration
        containerViews
        customViews
        deploymentView
        dynamicViews
        filteredViews
        systemContextView
        systemLandscapeView
        ;
    };
}
