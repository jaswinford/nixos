{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    obsidian
    dotnet-sdk
    remmina
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
        redhat.ansible
        ms-dotnettools.csharp
        ms-dotnettools.csdevkit
        ms-dotnettools.vscode-dotnet-runtime
      ];
      userSettings = {
        "git.confirmSync" = false;
        "update.mode" = "none";
        "database-client.autoSync" = true;
        "database-client.capitalizeKeywordsWhenFormatting" = true;
        "vs-kubernetes" = {
          "vs-kubernetes.crd-code-completion" = "enabled";
        };
      };
    };
    nixpkgs.config.permittedInsecurePackages = [
      "electron-27.3.11"
    ];
  };
}
