{
  buildGoModule,
  lib,
  sources,
}:
buildGoModule {
  inherit (sources.bafi) src pname version;

  vendorSha256 = "sha256-qdCdyLseVg3dtZ0AzUVhMZABtRNNU3DCAiDdHn0Jimk=";

  meta = {
    description = "Universal JSON, BSON, YAML, CSV, XML converter with templates";
    mainProgram = "bafi";
    homepage = "https://github.com/mmalcek/bafi";
  };
}
