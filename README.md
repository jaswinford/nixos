# Adam's Nixos Config

These are all of my system configurations as a collection of nix files.

## Devices managed

| Device     | OS           | Purpose                     |
| ---        | ---          | ---                         |
| wx-001     | NixOS        | Gaming Desktop              |
| iel-100123 | NixOS on WSL | Work Laptop WSL environment |

## TODO
- [X] Export Stylix to a dedicated Module
- [X] Migrate Stylix to a static theme to improve rebuild times.
- [ ] Fix the issue with wsl-modules for iel-100123. It's requiring --impure to rebuild
