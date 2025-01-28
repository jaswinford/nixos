{...}: {
  services.silverbullet = {
    enable = true;
    spaceDir = "/var/lib/silverbullet";
    user = "silverbullet";
    group = "silverbullet";
    openFirewall = true;
    listenPort = 80;
    listenAddress = "0.0.0.0";
    # Will add env file at later date
  };
}
