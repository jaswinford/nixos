{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      maple-mono
      font-awesome
      terminus-nerdfont
      kanji-stroke-order-font
      liberation_ttf
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
        monospace = ["Noto Mono"];
      };
      allowBitmaps = false;
    };
  };
}
