{pkgs, ...}: {
  users.extraUsers.nextcloud.extraGroups = [
    "media"
  ];
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [80];
    };
  };

  networking.hosts = {
    "10.0.1.108" = ["fs01" "fs01.jadam.local"];
  };
  environment.systemPackages = with pkgs; [
    exiftool
    ffmpeg_6-headless
  ];

  services.onlyoffice = {
    enable = true;
  };

  services.postgresql = {
    enable = true;
    ensureUsers = [
      {
        name = "nextcloud";
        ensureDBOwnership = true;
      }
      {
        name = "onlyoffice";
        ensureDBOwnership = true;
      }
    ];
    ensureDatabases = [
      "nextcloud"
      "onlyoffice"
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
      config_is_read_only = "true";
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
