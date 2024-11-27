# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  config,
  lib,
  pkgs,
  ...
}: {
  age.secrets.syncthing-key = {
    file = ../../secrets/IEL-100123.syncthing.key.age;
  };
  age.secrets.syncthing-cert = {
    file = ../../secrets/IEL-100123.syncthing.cert.age;
  };
  wsl.enable = true;
  wsl.defaultUser = "adam";
  wsl.wslConf.network.generateResolvConf = false;
  wsl.wslConf.network.hostname = "IEL-100123";

  networking.nameservers = [
    "10.0.0.2"
  ];

  networking.search = [
    "iel.local"
  ];

  environment.systemPackages = with pkgs; [
  ];

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  system.stateVersion = "24.05"; # Did you read the comment?
  # services.syncthing = {
    # key = "${config.age.secrets.syncthing-key.path}";
    # cert = "${config.age.secrets.syncthing-cert.path}";
  # };
}
