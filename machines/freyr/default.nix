# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
  ];

  age.secrets.syncthing-key = {
    file = ../../secrets/freyr.syncthing.key.age;
  };
  age.secrets.syncthing-cert = {
    file = ../../secrets/freyr.syncthing.cert.age;
  };
  networking.hostId = "cea75a76";

  services.getty.autologinUser = "adam";

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Boot settings
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Decrypt LUKS
  boot.initrd.luks = {
    reusePassphrases = true;
    devices = {
      cryptroot = {
        device = "/dev/nvme0n1p2";
        fallbackToPassword = true;
      };
    };
  };

  networking.dhcpcd.enable = true;

  # Enable Steam
  # programs.steam = {
    # enable = true;
    # remotePlay.openFirewall = true;
    # dedicatedServer.openFirewall = true;
  # };

  # System packages
  environment.systemPackages = with pkgs; [
    # discord
    # moonlight-qt
    pavucontrol
    light
    sof-firmware
    linux-firmware
    # go
    # gopls
    # python3
    # adwaita-icon-theme
  ];

  # Ignore laptop lid
  services.logind.lidSwitch = "ignore";

  # GPG agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "23.05"; # Did you read the comment?
}
