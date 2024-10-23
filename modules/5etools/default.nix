{
  pkgs,
  modulesPath,
  ...
}: let
  repo-5etools = "https://github.com/5etools-mirror-3/5etools-src.git";
in {
  networking.firewall.allowedTCPPorts = [
    80
  ];

  services.nginx.enable = true;
  services.nginx.virtualHosts."5etools.jadam.space" = {
    root = "/var/www/5etools";
  };

  services.cron.systemCronJobs = [
    "0 * * * * cd /var/www/5etools && git pull"
  ];
}
