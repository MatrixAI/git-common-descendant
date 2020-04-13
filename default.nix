{ stdenvNoCC
, nix-gitignore
, makeWrapper
, lib
, git
}:

stdenvNoCC.mkDerivation rec {
  pname = "git-common-descendant";
  version = "2020-04-09";

  src = nix-gitignore.gitignoreSource [] ./.;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -D -m755 git-common-descendant $out/bin/git-common-descendant
  '';

  postFixup = ''
    wrapProgram $out/bin/git-common-descendant --set PATH ${lib.makeBinPath [ git ]}
  '';
}
