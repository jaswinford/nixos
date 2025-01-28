{pkgs, ...}: {
  boot.tmp.useTmpfs = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  environment.localBinInPath = true;
  environment.sessionVariables = {
    CHARM_HOST = "charm.jadam.space";
    LIBVA_DRIVE_NAME = "iHD";
  };

  environment.systemPackages = with pkgs; [
    nano
    vim
    gopass
    libnotify
    alejandra
    wget
    curl
    dig
    neofetch
    wget
    pinentry-curses
    git
    jq
    ansible
  ];
  home-manager = {
    backupFileExtension = "bak";
    sharedModules = [{stylix.enable = true;}];
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  networking.nameservers = [
    "10.0.1.2" # Home DNS
    "100.77.60.123" # Personal DNS on Tailscale
    "8.8.8.8" # Google as fallback
  ];

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than +5";

  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  security.sudo.wheelNeedsPassword = false;

  services.cron.systemCronJobs = [
    "*/1 * * * * cd /etc/nixos && git pull -q origin master && nixos-rebuild switch"
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      UseDns = true;
      PermitRootLogin = "prohibit-password";
    };
  };

  time.timeZone = "America/New_York";
}
