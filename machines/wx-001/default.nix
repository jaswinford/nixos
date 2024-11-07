# Old config for my Gaming workstation. Currently in migration to flakes
{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [./hardware.nix];
  boot.loader.systemd-boot.enable = true;
  # Rollback root to blank state at every boot
  # Disabled until I have a working system I can work from
  # boot.initrd.postDeviceCommands = lib.mkAfter ''
  #  zfs rollback -r rpool/local/root@blank
  #'';

  networking.hostId = "4a13754f";

  hardware.graphics = {
    enable = true;
  };

  hardware.bluetooth.enable = true;

  services.openssh.enable = true;

  # Nvidia settings
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };
  boot.initrd.kernelModules = ["nvidia"];
  boot.extraModulePackages = [config.boot.kernelPackages.nvidia_x11];

  # Steam
  programs.steam.enable = true;

  # GPG config
  # Enable smart card daemon
  services.pcscd.enable = true;
  # Enable GPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  environment.systemPackages = with pkgs; [
    tree
    pavucontrol
    go
    gopls
    python3
    screen
    discord
    bambu-studio
  ];

  networking.nat = {
    enable = true;
    internalInterfaces = ["ve-+"];
    externalInterface = "enp3s0";
    enableIPv6 = true;
  };
  
  system.stateVersion = "24.05"; # Don't change unless needed to fix something.
}
