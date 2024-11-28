{
  lib,
  config,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
    user = "adam";
    openDefaultPorts = true;
    settings = {
      gui = {
        theme = "black";
      };
      options = {
        localAnnounceEnabled = false;
      };

      folders = {
        "${config.services.syncthing.dataDir}/documents" = {
          id = "documents";
          devices = ["IEL-100123" "Freyr" "Adam-Cell" "legion"];
        };
      };
      devices = {
        legion = {id = "BNZZ7CZ-5ALJJFM-MRCXKBQ-3K7W2LO-CGGW2J6-AVC46PU-NZAAWSO-GTVJIAU";};
        IEL-100123 = {id = "BAU7YPT-DM4BGQ3-42XT25T-J67NVE6-UT3CEQS-ZSF6AJZ-ON2IJUE-WE6CMQA";};
        Freyr = {id = "ZKQLFXV-TEIG4DH-JXE4SD3-OXQUMKO-HEQA6E4-JZ5IMMN-DWPYFZJ-RTH5QAN";};
        Adam-Cell = { id = "67QZ2EE-7WP3ZTG-PIIK2JU-WVXDQQA-N5YXFOS-LIN6NGI-QVIULOP-OOBYUAR";};
      };
    };

    overrideFolders = true;
    overrideDevices = true;
  };

  services.syncthing = {
    key = "${config.age.secrets.syncthing-key.path}";
    cert = "${config.age.secrets.syncthing-cert.path}";
  };

  # Disable creation of default Sync folder.
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
}
