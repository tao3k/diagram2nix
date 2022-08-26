{
  stdenv,
  lib,
  autoPatchelfHook,
  structurizr-sources,
  unzip,
  jre,
  ...
}:
stdenv.mkDerivation {
  inherit (structurizr-sources.structurizr-cli) src pname version;

  nativeBuildInputs = lib.optionals stdenv.hostPlatform.isLinux [
    autoPatchelfHook
    unzip
    jre
  ];

  unpackPhase = "unzip $src";

  dontStrip = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out

    mkdir -p $out/bin
    mv {lib,docs} $out/bin
    mv structurizr* $out/bin

    runHook postInstall
  '';
  meta = {
    description = "Structurizr CLI";
    mainProgram = "structurizr.sh";
    homepage = "https://github.com/structurizr/cli";
  };
}
