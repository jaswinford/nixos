{
  pkgs,
  modulesPath,
  ...
}:{
  networking.firewall.allowedTCPPorts = [
    80
  ];

  "5etools-link" = {
    link = repo-5etools;
    target = "/var/www/5etools";
  };
  services.nginx.enable = true;
  services.nginx.virtualHosts."5etools.jadam.space" = {
    root = "/var/www/5etools";
  };

  services.cron.systemCronJobs = [
    "0 * * * * cd /var/www/5etools && git pull && nixos-rebuild switch"
  ];
}
