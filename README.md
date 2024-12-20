# nixos-custom

## How to Build

```bash
nix build .#nixosConfigurations.<name>.config.system.build.isoImage
# Example: nix build .#nixosConfigurations.xfce.config.system.build.isoImage
```

## Reference

https://nixos.wiki/wiki/Creating_a_NixOS_live_CD
