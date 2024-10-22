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
      k = "kubectl";
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
    glow
	btop
  ];

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
  };

  programs.tmux = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    withPython3 = true;
    defaultEditor = true;
    extraConfig = ''
      set conceallevel=2
      set foldlevelstart=3
      set number
      set wrap
      set linebreak
      set nocompatible
      set tabstop=4
      let mapleader= ' '
    '';
    plugins = with pkgs.vimPlugins; [
      mason-nvim
      nvim-lspconfig
      mason-lspconfig-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      cmp-buffer
      cmp-path
      cmp-cmdline
      neodev-nvim
      nvim-autopairs
      nvim-treesitter
      which-key-nvim
      comment-nvim
      nvim-web-devicons
      lualine-nvim
      nvim-navic
      bufferline-nvim
      telescope-nvim
	  {
	    plugin =obsidian-nvim;
		type = "lua";
		config = ''
require("obsidian").setup({
  workspaces = {
    {
	  name = "personal",
	  path = "~/vaults/personal",
    },
	{
	  name = "work",
	  path = "~/vaults/work",
    },
  },
})
		'';
		}

    ];
  };

  # GPG
  programs.gpg = {
    enable = true;
    # TODO: Set immutable key management
  };
}
