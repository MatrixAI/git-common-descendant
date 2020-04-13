# git-common-descendants

Given 2 commits, this command will find the earliest common descendant.

## Installation

Building the package:

```sh
nix-build -E '(import ./pkgs.nix).callPackage ./default.nix {}'
```

Building the releases:

```sh
nix-build ./release.nix --attr application 
```

Install into Nix user profile:

```sh
nix-env -f ./release.nix --install --attr application
```

## Development

```sh
# development environment
nix-shell
# clean the build
link="$(readlink ./result)" \
&& rm ./result \
&& nix-store --delete "$link"
```
