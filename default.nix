{ stdenvNoCC
, lib
, fetchFromGitHub
, makeWrapper
, coreutils
, findutils
, nix
}:

stdenvNoCC.mkDerivation rec {
  name = "git-common-descendants-2020-04-09";

  src = fetchFromGitHub {
    owner = "MatrixAI";
    repo = "git-common-descendants";
    rev = "sdfsdfsdf";
    sha256 = "sdfsdfsdf";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -D -m755 git-common-descendants $out/bin/git-common-descendants
  '';

  postFixup = ''
    wrapProgram $out/bin/git-common-descendants --set PATH ${lib.makeBinPath [ coreutils findutils nix ]}
  '';
}
