# starship

My [Starship](https://starship.rs/) prompt config (Catppuccin Mocha).

## Install

1. Install Starship: https://starship.rs/guide/#%F0%9F%9A%80-installation
2. Use a **non-Mono** Nerd Font in your terminal (e.g. `MesloLGS Nerd Font`) so OS icons are full size
3. Copy the config:

```bash
mkdir -p ~/.config
curl -fsSL https://raw.githubusercontent.com/johnycsf/dotfiles/main/starship.toml \
  -o ~/.config/starship.toml
```

4. Add to `~/.bashrc` (or your shell rc):

```bash
eval "$(starship init bash)"
```

5. Open a new terminal.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
