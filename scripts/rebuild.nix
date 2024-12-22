{pkgs}:
pkgs.writeShellApplication {
  name = "rebuild";
  runtimeInputs = [pkgs.alejandra pkgs.libnotify];
  text = ''
    # A rebuild script that commits on a successful build
    set -e

    # cd to your config dir
    pushd /etc/nixos/

    # Autoformat your nix files
    alejandra . &>/dev/null

    # Shows your changes
    # git diff -U0 *.nix

    echo "NixOS Rebuilding..."

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch | sudo tee nixos-switch.log
    # sudo nixos-rebuild switch

    # Back to where you were
    popd

    # Notify all OK!
    notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
  '';
}
