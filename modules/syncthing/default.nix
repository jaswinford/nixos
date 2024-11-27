{
  lib,
  config,
  pkgs,
  ...
}: {

services.syncthing = {
  enable = true;
  openDefaultPorts = true;
  settings = {
    gui = {
      theme = "black";
    };
    options = {
      localAnnounceEnabled = false;
    };
  };

  overrideFolders = true;
  overrideDevices = true;

  folders = {
    "${config.services.syncthing.dataDir}/documents" = {
      id = "documents";
      devices = [ "IEL-100123" ];
    };
  };
  devices = {
    IEL-100123 = { id = "AY4KG52-7G3I4ZO-MMBHEFM-WXVTW4I-M4K3PKE-TSWKI6V-XKAEZKH-MJ3P2A5"; };
  };
};

# Disable creation of default Sync folder.
systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";

}
