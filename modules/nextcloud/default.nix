{ config, pkgs, ...}: {
  containers.nextcloud = {
    autoStart = true;
    config = { config, pkgs, ... }: {
      system.stateVersion = "24.11";
      networking = {
        firewall = {
          enable = true;
          allowedTCPPorts = [ 80 ];
        };
      };

      services.nextcloud = {
        enable = true;
        package = pkgs.nextcloud30;
        hostName = "nextcloud.jadam.space";
        maxUploadSize = "5G";
        settings = {
          default_phone_region = "US";
          overwriteprotocol = "https";
          trusted_domains = ["localhost"];
        };
        database.createLocally = true;
        config = {
          adminuser = "root";
          adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
        #  dbtype = "pgsql";
        };
        notify_push = {
          enable = true;
        };
      };
    };
  };
}
