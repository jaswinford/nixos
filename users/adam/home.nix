{
  pkgs,
  config,
  home-manager,
  ...
}: {
  home.username = "adam";
  home.homeDirectory = "/home/adam";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  # Zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      open = "xdg-open";
      k = "kubectl";
      vim = "hx";
      nvim = "hx";
      vi = "hx";
    };
    oh-my-zsh = {
      enable = true;
      theme = "essembeh";
      plugins = [
        "git"
      ];
    };
  };

  home.packages = with pkgs; [
    mods
    ripgrep-all
    glow
    btop
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [
      pkgs.markdown-oxide
      pkgs.delve
      pkgs.rust-analyzer
      pkgs.yaml-language-server
      pkgs.taplo
      pkgs.vscode-langservers-extracted
      pkgs.bash-language-server
      pkgs.helm-ls
      pkgs.nil
      pkgs.openscad-lsp
    ];
    ignores = [
      "!.gitignore"
    ];
  };

  # Git
  programs.git = {
    enable = true;
    ignores = [
      "*~"
      "*.swp"
    ];
    userEmail = "talwyn.87@gmail.com";
    userName = "Adam Swinford";
    extraConfig = {
      github.user = "jaswinford";
      init.defaultBranch = "main";
    };
  };

  # URXVT Terminal = {
  # programs.urxvt = {
  #   enable = true;
  # };
  # Alacritty

  programs.alacritty = {
    enable = true;
    settings = {
      selection.save_to_clipboard = true;
    };
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
    set -g default-terminal "tmux-256color"
    set -ag terminal-overrides ",xterm-256color:RGB"
    '';
    
  };

  # GPG
  programs.gpg = {
    enable = true;
    # TODO: Set immutable key management
  };
}
