with import <nixpkgs> {};
let
  my-python-packages = python-packages: [
    python-packages.pip
    python-package.jq
    python-packages.numpy
    python-packages.msrestazure
    python-packages.requests
  ];
  my-python = python311.withPackages my-python-packages;
in
  pkgs.mkShell {
    allowUnfree = true;
    buildInputs = [
      pre-commit
      azure-cli
      jq
      kubectl
      pwgen
      my-python
      terraform
    ];
    shellHook = ''
      export PIP_PREFIX="$(pwd)/_build/pip_packages"
      export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python3.11/site-packages:$PYTHONPATH"
      unset SOURCE_DATE_EPOCH
      export PATH="$PATH:$(pwd)/_build/pip_packages/bin"
    '';
  }

