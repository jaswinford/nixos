{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    obsidian
  ];

  environment.variables = {
    DONT_PROMPT_WSL_INSTALL = "true";
  };
  home-manager.users.adam = {
    programs.vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        redhat.vscode-yaml
        davidanson.vscode-markdownlint
        ms-kubernetes-tools.vscode-kubernetes-tools
        tim-koehler.helm-intellisense
        golang.go
        ms-python.python
        ms-python.pylint
        sourcery.sourcery
      ];
      userSettings = {
        "git.confirmSync" = false;
      };
    };
  };
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];
}
