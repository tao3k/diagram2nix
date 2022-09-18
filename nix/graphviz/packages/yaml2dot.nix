{
  buildGoModule,
  lib,
  sources,
}:
buildGoModule {
  inherit (sources.yml2dot) src pname version;

  vendorSha256 = "sha256-hvo0F6DOp66KgBsXn7n+tJtdF+HsPSwWsJRT7aLprUA=";

  meta = {
    description = "Turn YAML into beautiful Graph";
    mainProgram = "yml2dot";
    homepage = "https://github.com/lucasepe/yml2dot";
  };
}
