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
    rev = "4a53a67cdf6ff9a7503573167de041071671512a";
    sha256 = "18ny6hdchd5fir9nlah7g2q3ipiv67ygz8y7wd3hgvgh3d9hbra4";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -D -m755 git-common-descendants $out/bin/git-common-descendants
  '';

  postFixup = ''
    wrapProgram $out/bin/git-common-descendants --set PATH ${lib.makeBinPath [ coreutils findutils nix ]}
  '';
}
