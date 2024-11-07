{
  lib,
  config,
  pkgs,
  ...
}: {

services.nextcloud = {
  enable = true;
  package = pkgs.nextcloud29;
  hostName = "nextcloud.jadam.space";
  maxUploadSize = "5G";
  default_phone_region = "US";
  overwriteprotocol = "https";
  database.createLocally = true;
  config = {
    dbtype = "pgsql";
  };
  notify_push = {
    enable = true;
  };
  extraApps = {
    inherit (config.services.nextcloud.package.packages.apps) bookmarks calendar contacts deck keeweb mail news notes onlyoffice polls tasks twofactor_webauthn;
  };
  extraAppsEnable = true;
};
}
