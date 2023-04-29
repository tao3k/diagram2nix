{l}: let
  unpopRecursive = item:
    if l.isAttrs item
    then
      if l.hasAttr "__meta__" item
      then l.mapAttrs (n: v: unpopRecursive v) l.pop.unpop item
      else l.mapAttrs (n: v: unpopRecursive v) item
    else if l.isList item
    then map unpopRecursive item
    else item;
in {
  recursiveUnpop = l.pop.pop {
    extension = self: super: {
      __unpop__ = unpopRecursive (l.pop.unpop self);
    };
  };
}
