# starship

My [Starship](https://starship.rs/) prompt config (Catppuccin Mocha).

Works with **bash** and **zsh**.

## Quick install

1. Install Starship: https://starship.rs/guide/#%F0%9F%9A%80-installation
2. Use a **non-Mono** Nerd Font in your terminal (e.g. `MesloLGS Nerd Font`) so OS icons are full size
3. Run the installer (configures every shell it finds):

```bash
curl -fsSL https://raw.githubusercontent.com/johnycsf/dotfiles/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/johnycsf/dotfiles.git
cd dotfiles
./install.sh        # bash and/or zsh
./install.sh bash   # bash only
./install.sh zsh    # zsh only
```

4. Open a new terminal (or `source ~/.bashrc` / `source ~/.zshrc`).

## Manual install

```bash
mkdir -p ~/.config
curl -fsSL https://raw.githubusercontent.com/johnycsf/dotfiles/main/starship.toml \
  -o ~/.config/starship.toml
```

Then add **one** of these to your shell rc:

**bash** (`~/.bashrc`):

```bash
eval "$(starship init bash)"
```

**zsh** (`~/.zshrc`):

```zsh
eval "$(starship init zsh)"
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
