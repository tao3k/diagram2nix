{
  l,
  jsonSchema,
  inputs,
  cell,
}: {
  new = {...}:
    l.pop {
      extension = self: super: {
        softSystem = {};
        addSoftSystem = softSystem:
          l.extendPop self (self: super: {
            softSystems = [super.softSystem softSystem];
          });
        addSoftSystems = softSystem:
          l.foldl (p: t: p.addSoftSystem t) self softSystem;
      };
    };
}
