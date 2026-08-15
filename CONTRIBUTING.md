# Contributing

Thanks for wanting to help. This repo is a simple [Starship](https://starship.rs/) prompt config (Catppuccin Mocha) for everyday terminals — bash and zsh.

## How to contribute

1. Fork the repository
2. Create a branch for your change
3. Make the smallest change that solves the problem
4. Test in a real terminal:
   - Copy or symlink `starship.toml` to `~/.config/starship.toml`
   - Or run `./install.sh` from your fork
   - Open a new shell (or `source ~/.bashrc` / `source ~/.zshrc`) and confirm the prompt still looks right
5. Open a Pull Request that explains:
   - what felt wrong or missing
   - what you changed
   - how you verified it (shell + terminal + font if relevant)

## Guidelines

- Keep the setup beginner-friendly — `./install.sh` and the README curl one-liner should keep working
- Prefer clarity over cleverness in `starship.toml` and docs
- Do not commit personal machine names, private paths, or secrets
- If you change modules or colors, say why (readability, icons, Catppuccin consistency, etc.)
- Use a **non-Mono** Nerd Font when checking icons (e.g. `MesloLGS Nerd Font`) so OS glyphs stay full size

## Issues

Bug reports and ideas are welcome. Include:

- OS and terminal app (e.g. Fedora + Ptyxis, macOS + iTerm2)
- Shell (`bash` / `zsh`) and Starship version (`starship --version`)
- Font in use (if icons look wrong)
- Exact command you ran (if install-related)
- Error output or a screenshot of the prompt
