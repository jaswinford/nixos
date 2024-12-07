{
  lib,
  config,
  pkgs,
  ...
}: {

environment.systemPackages = with pkgs; [
  obsidian
  logseq
  vscode-fhs
];

nixpkgs.config.permittedInsecurePackages = [
  "electron-27.3.11"
];
}
