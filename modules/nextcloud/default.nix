{ config, pkgs, ...}: {
      networking = {
        firewall = {
          enable = true;
          allowedTCPPorts = [ 80 ];
        };
      };

      environment.systemPackages = with pkgs; [

        exiftool
        ffmpeg_6-headless
      ];

      services.postgresql = {
        enable = true;
        ensureUsers = [
          {
            name = "nextcloud";
            ensureDBOwnership = true;
          }
        ];      
        ensureDatabases = [
          "nextcloud"
        ];
      };

      systemd.services."nextcloud-setup" = {
        requires = ["postgresql.service"];
        after = ["postgresql.service"];
      };

      services.nextcloud = {
        enable = true;
        package = pkgs.nextcloud30;
        configureRedis = true;
        hostName = "nextcloud.jadam.space";
        maxUploadSize = "5G";
        settings = {
          default_phone_region = "US";
          overwriteprotocol = "https";
          trusted_domains = ["localhost"];
        };
        # database.createLocally = true;
        config = {
          adminuser = "root";
          adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
          dbuser = "nextcloud";
          dbtype = "pgsql";
          dbname = "nextcloud";
          dbhost = "/run/postgresql";
        };
        # notify_push = {
          # enable = true;
        # };
      };
}
