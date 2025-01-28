{config, ...}: {
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
        urAccepted = -1;
      };

      folders = {
        "${config.services.syncthing.dataDir}/documents" = {
          id = "documents";
          devices = ["IEL-100123" "Freyr" "Adam-Cell" "legion"];
        };
        "${config.services.syncthing.dataDir}/Sync" = {
          id = "default";
          devices = ["IEL-100123" "Freyr" "Adam-Cell" "legion"];
        };
        "${config.services.syncthing.dataDir}/vscode-profile" = {
          id = "vscode-profile";
          devices = ["legion" "Freyr" "IEL-100123"];
        };
      };
      devices = {
        legion = {
          id = "BNZZ7CZ-5ALJJFM-MRCXKBQ-3K7W2LO-CGGW2J6-AVC46PU-NZAAWSO-GTVJIAU";
          addresses = [
            "tcp://100.99.117.10:22000"
          ];
          autoAcceptFolders = true;
        };
        IEL-100123 = {
          id = "BAU7YPT-DM4BGQ3-42XT25T-J67NVE6-UT3CEQS-ZSF6AJZ-ON2IJUE-WE6CMQA";
          addresses = [
            "tcp://100.69.44.30:22000"
          ];
          autoAcceptFolders = true;
        };
        Freyr = {
          id = "ZKQLFXV-TEIG4DH-JXE4SD3-OXQUMKO-HEQA6E4-JZ5IMMN-DWPYFZJ-RTH5QAN";
          addresses = [
            "tcp://100.109.149.117:22000"
          ];
          autoAcceptFolders = true;
        };
        Adam-Cell = {
          id = "67QZ2EE-7WP3ZTG-PIIK2JU-WVXDQQA-N5YXFOS-LIN6NGI-QVIULOP-OOBYUAR";
          addresses = [
            "tcp://100.90.179.11:22000"
          ];
          autoAcceptFolders = true;
        };
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
