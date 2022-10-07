{l}: let
  unpopRecursive = item:
    if l.isAttrs item
    then
      if l.hasAttr "__unpop__" item
      then l.mapAttrs (n: v: unpopRecursive v) item.__unpop__
      else l.mapAttrs (n: v: unpopRecursive v) item
    else if l.isList item
    then map unpopRecursive item
    else item;
in {
  recursiveUnpop = l.pop {
    extension = self: super: {
      __unpop__ = unpopRecursive (l.unpop self);
    };
  };
}
