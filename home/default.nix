# Shared home-manager configs for all systems and users
{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ripgrep
    nixpkgs-fmt
    gnumake
    autoconf
    wget
    unzip
    git
    curl
    whois
    dig
  ];
}
