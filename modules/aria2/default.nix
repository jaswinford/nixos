{
  lib,
  config,
  pkgs,
  ...
}: {

age.secrets.rpc-token = {
  file = ../../secrets/aria2-rpc-token.age;
};

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
  rpcSecretFile = config.age.secrets.rpc-token.path;
  openPorts = true;
};


}
