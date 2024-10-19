{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.jira-cli-go
    pkgs.cilium-cli
    pkgs.kubernetes-helm
    pkgs.talosctl
    pkgs.kubectl
  ];
}
