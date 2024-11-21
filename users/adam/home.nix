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

  # programs.neovim = {
  #   enable = true;
  #   vimAlias = true;
  #   viAlias = true;
  #   withPython3 = true;
  #   defaultEditor = true;
  #   extraConfig = ''
  #     set conceallevel=2
  #     set foldlevelstart=3
  #     set number
  #     set wrap
  #     set linebreak
  #     set nocompatible
  #     let mapleader= ' '
  #   '';
  #   extraLuaConfig = ''
  #     vim.opt.clipboard = 'unnamedplus'
  #     vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
  #     vim.opt.mouse = 'a'

  #     vim.opt.tabstop = 4
  #     vim.opt.softtabstop = 4
  #     vim.opt.shiftwidth = 4
  #     vim.opt.expandtab = true

  #        vim.opt.number = true
  #     vim.opt.relativenumber = true
  #     vim.opt.cursorline = true
  #     vim.opt.splitbelow = true
  #     vim.opt.splitright = true

  #     vim.opt.incsearch = true
  #     vim.opt.hlsearch = false
  #     vim.opt.ignorecase = true
  #     vim.opt.smartcase = true
  #   '';
  #   plugins = with pkgs.vimPlugins; [
  #     mason-nvim
  #     nvim-lspconfig
  #     mason-lspconfig-nvim
  #     {
  #       plugin = nvim-cmp;
  #       type = "lua";
  #       config = ''
  #               local luasnip = require("luasnip")
  #               local cmp = require("cmp")
  #         		  cmp.setup({
  #         		    snippet = {
  #         			  expand = function(args)
  #         			    require('luasnip').lsp_expand(args.body)
  #         		      end,
  #         		    },
  #         			mapping = cmp.mapping.preset.insert({
  #                 -- Use <C-b/f> to scroll the docs
  #                 ['<C-b>'] = cmp.mapping.scroll_docs( -4),
  #                 ['<C-f>'] = cmp.mapping.scroll_docs(4),
  #                 -- Use <C-k/j> to switch in items
  #                 ['<C-k>'] = cmp.mapping.select_prev_item(),
  #                 ['<C-j>'] = cmp.mapping.select_next_item(),
  #                 -- Use <CR>(Enter) to confirm selection
  #                 -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  #                 ['<CR>'] = cmp.mapping.confirm({ select = true }),

  #                 -- A super tab
  #                 -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
  #                 ["<Tab>"] = cmp.mapping(function(fallback)
  #                     -- Hint: if the completion menu is visible select next one
  #                     if cmp.visible() then
  #                         cmp.select_next_item()
  #                     elseif has_words_before() then
  #                         cmp.complete()
  #                     else
  #                         fallback()
  #                     end
  #                 end, { "i", "s" }), -- i - insert mode; s - select mode
  #                 ["<S-Tab>"] = cmp.mapping(function(fallback)
  #                     if cmp.visible() then
  #                         cmp.select_prev_item()
  #                     elseif luasnip.jumpable( -1) then
  #                         luasnip.jump( -1)
  #                     else
  #                         fallback()
  #                     end
  #                 end, { "i", "s" }),
  #             }),

  #           -- Let's configure the item's appearance
  #           -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
  #           formatting = {
  #               -- Set order from left to right
  #               -- kind: single letter indicating the type of completion
  #               -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
  #               -- menu: extra text for the popup menu, displayed after "word" or "abbr"
  #               fields = { 'abbr', 'menu' },

  #               -- customize the appearance of the completion menu
  #               format = function(entry, vim_item)
  #                   vim_item.menu = ({
  #                       nvim_lsp = '[Lsp]',
  #                       luasnip = '[Luasnip]',
  #                       buffer = '[File]',
  #                       path = '[Path]',
  #                   })[entry.source.name]
  #                   return vim_item
  #               end,
  #           },

  #           -- Set source precedence
  #           sources = cmp.config.sources({
  #               { name = 'nvim_lsp' },    -- For nvim-lsp
  #               { name = 'luasnip' },     -- For luasnip user
  #               { name = 'buffer' },      -- For buffer word completion
  #               { name = 'path' },        -- For path completion
  #           })
  #         })
  #       '';
  #     }
  #     cmp-nvim-lsp
  #     cmp_luasnip
  #     cmp-buffer
  #     cmp-path
  #     cmp-cmdline
  #     {
  #       plugin = mason-nvim;
  #       type = "lua";
  #       config = ''
  #         require('mason').setup({
  #             ui = {
  #                 icons = {
  #                     package_installed = "✓",
  #                     package_pending = "➜",
  #                     package_uninstalled = "✗"
  #                 }
  #             }
  #         })
  #       '';
  #     }
  #     {
  #       plugin = mason-lspconfig-nvim;
  #       type = "lua";
  #       config = ''
  #         require('mason-lspconfig').setup({
  #             -- A list of servers to automatically install if they're not already installed
  #             ensure_installed = { 'pylsp', 'lua_ls', 'rust_analyzer', 'gopls' },
  #         })
  #       '';
  #     }
  #     luasnip

  #     neodev-nvim
  #     nvim-autopairs
  #     nvim-treesitter
  #     which-key-nvim
  #     comment-nvim
  #     nvim-web-devicons
  #     lualine-nvim
  #     nvim-navic
  #     bufferline-nvim
  #     {
  #       plugin = todo-comments-nvim;
  #       type = "lua";
  #       config = ''require('todo-comments').setup({})'';
  #     }
  #     telescope-nvim
  #     {
  #       plugin = obsidian-nvim;
  #       type = "lua";
  #       config = ''
  #         require("obsidian").setup({
  #           workspaces = {
  #             {
  #         	  name = "personal",
  #         	  path = "~/vaults/personal",
  #             },
  #         	{
  #         	  name = "work",
  #         	  path = "~/vaults/work",
  #             },
  #           },
  #         })
  #       '';
  #     }
  #   ];
  # };

  # programs.emacs = {
  #   enable = true;
  #   extraConfig = ''
  #     (require 'evil)
  #     (evil-mode 1)
  #   '';
  #   extraPackages = epkgs: [
  #     epkgs.evil
  #     epkgs.evil-org
  #     epkgs.org
  #     epkgs.evil-markdown
  #   ];
  # };

  # GPG
  programs.gpg = {
    enable = true;
    # TODO: Set immutable key management
  };
}
