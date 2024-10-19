{
  lib,
  config,
  pkgs,
  ...
}: {
  # Neovim settings
  programs.neovim = {
    enable = true;
  };
}
