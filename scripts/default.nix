{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    (import ./todo.nix {inherit pkgs;})
    (import ./commit.nix {inherit pkgs;})
    (import ./vmm.nix {inherit pkgs;})
    (import ./rebuild.nix {inherit pkgs;})
    (import ./scan.nix {inherit pkgs;})
  ];
}
