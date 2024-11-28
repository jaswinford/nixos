{
  lib,
  config,
  pkgs,
  ...
}: {

environment.systemPackages = with pkgs; [
  logseq
];

nixpkgs.config.permittedInsecurePackages = [
  "electron-27.3.11"
];
}
