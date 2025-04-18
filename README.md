## My NixOS configurations

Just this, my NixOS configuration. I use one machine and one user. I use
home-manager to manage all configurations related to my user (except for the
ssh and gpg keys). I use Flakes to configure the system for me.

## Files tree

```tree
.
├── flake.lock
├── flake.nix
├── home
│   ├── home.nix
│   ├── rust-crates
│   │   ├── default.nix
│   │   └── ...
│   └── ...
├── host
    ├── awiteb.nix
    ├── hardware-configuration.nix
    ├── hardware.nix
    ├── host.nix
    ├── network.nix
    └── services
        ├── default.nix
        └── ...
```

- `flake.nix` and `flake.lock`: Flake files, to ro reproduce the same system with the same versions.
- `home.nix`: Home manager configurations, running in `flake.nix`. It contains by programs
              with their configurations. Not all programs are configured.
- `rust-crates`: A module running in `home.nix` to add rust packages to the list of my packages.
                Read the top comment in `rust-crates/default.nix` to know how it works.
- `host/host.nix`: My host configurations, same as `/etc/nixos/configuration.nix` without flakes.


## License

MIT
