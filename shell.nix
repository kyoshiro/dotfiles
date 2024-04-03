with import <nixpkgs> {};
let
  my-python-packages = python-packages: [
    python-packages.pip
    python-packages.numpy
    #python-packages.systemtools
    python-packages.msrestazure
    python-packages.requests
  ];
  my-python = python311.withPackages my-python-packages;
in
  pkgs.mkShell {
    allowUnfree = true;
    buildInputs = [
      pre-commit
      jq
      kubectl
      pwgen
      my-python
    ];
    shellHook = ''
      export PIP_PREFIX="$(pwd)/_build/pip_packages"
      export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python3.11/site-packages:$PYTHONPATH"
      unset SOURCE_DATE_EPOCH
      export PATH="$PATH:$(pwd)/_build/pip_packages/bin"
      export PRE_COMMIT_HOME=.precommit
    '';
  }
