{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.jira-cli-go
    pkgs.cilium-cli
    pkgs.kubernetes-helm
    pkgs.talosctl
    pkgs.kubectl
    pkgs.nodejs_22
    pkgs.terraform
    pkgs.terraform-ls
  ];
}
