{
  lib,
  config,
  pkgs,
  ...
}: {

networking.firewall.allowedTCPPorts = [
  80
];

# Enable web server for webui
services.nginx = {
  enable = true;
  virtualHosts."downloads.jadam.local" = {
    root = "/var/www/";
  };
};

# Enable Aira2 downlod manager and turn on RPC service
services.aria2 = {
  enable = true;
  settings = {
    enable-rpc = true;
    dir = "/var/lib/aria2/Downloads";
  };
  openPorts = true;
};


}
