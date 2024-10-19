{
  lib,
  config,
  pkgs,
  stylix,
  ...
}: {
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.opacity = {
    terminal = 0.95;
    popups = 0.95;
  };
  stylix.fonts = {
    serif = {
      package = pkgs.noto-fonts;
      name = "Noto Serif";
    };
    sansSerif = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
    };
    monospace = {
      package = pkgs.maple-mono;
      name = "Maple Mono";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
    sizes = {
      applications = 11;
      desktop = 11;
      popups = 11;
      terminal = 11;
    };
  };
  stylix.image = pkgs.fetchurl {
    url = "https://gruvbox-wallpapers.pages.dev/wallpapers/anime/ghibli-japanese-walled-garden.png";
    sha256 = "d742efdb9574446d269f0fcef740de55c84235625b764b54003b6e23e7a71303";
  };
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
}
