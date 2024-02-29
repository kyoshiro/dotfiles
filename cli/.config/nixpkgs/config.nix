{ allowBroken = true;
  allowUnfree = true;
  packageOverrides = pkgs:
    {
      python3 = pkgs.python3.overrideAttrs (attrs:
        pkgs.lib.attrsets.recursiveUpdate attrs { meta.priority = -100; });
    };
}
