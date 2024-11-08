{
  pkgs,
  modulesPath,
  ...
}: {
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  security.acme = {
    acceptTerms = true;
    email = "talwyn.87@gmail.com";
  };

  services.nginx.enable = true;
  services.nginx.virtualHosts = let
    SSL = {
      enableACME = true;
      forceSSL = true;
    };
  in {
    "jadam.space" =
      SSL
      // {
        locations."/".proxyPass = "http://10.0.1.7:80";
        serverAliases = [
          "www.jadam.space"
        ];
      };

    "git.jadam.space" =
      SSL
      // {
        locations."/".proxyPass = "https://10.0.1.30";
      };
    "jellyfin.jadam.space" =
      SSL
      // {
        locations."/".proxyPass = "http://10.0.1.50:8096";
        locations."/".proxyWebsockets = true;
        locations."/".extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_set_header X-Forwarded-Protocol $scheme;
          proxy_set_header X-Forwarded-Host $http_host;
          proxy_buffering off;'';
      };
    "vtt0.jadam.space" =
      SSL
      // {
        locations."/".proxyPass = "http://10.0.1.41:30000";
        locations."/".proxyWebsockets = true;
      };
    "vtt1.jadam.space" =
      SSL
      // {
        locations."/".proxyPass = "http://10.0.1.40:30000";
        locations."/".proxyWebsockets = true;
      };
    "mailserver.gamers-grotto.com" =
      SSL
      // {
        locations."/".proxyPass = "http://10.0.1.70";
      };
    "vaultwarden.jadam.space" =
      SSL
      // {
        locations."/".proxyPass = "http://10.0.1.5:8222";
      };
    "nextcloud.jadam.space" =
     SSL
    // {
      locations."/".proxyPass = "http://10.0.1.20";
    };
    "pve.jadam.space" =
      SSL
      // {
        locations."/".proxyPass = "https://10.0.1.6:8006";
        locations."/".proxyWebsockets = true;
      };
    "5etools.jadam.space" =
      SSL
      // {
        locations."/".proxyPass = "http://10.0.1.8";
      };
  };
}
