#!/usr/bin/env bash
# Install starship.toml and wire up bash and/or zsh.
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/johnycsf/dotfiles/main/starship.toml"
MARKER="# starship (johnycsf/dotfiles)"

die() { echo "error: $*" >&2; exit 1; }

need_starship() {
  if ! command -v starship >/dev/null 2>&1; then
    die "starship not found. Install it first: https://starship.rs/guide/#%F0%9F%9A%80-installation"
  fi
}

install_config() {
  local src dest="$HOME/.config/starship.toml"
  mkdir -p "$HOME/.config"

  if [[ -f "${BASH_SOURCE[0]%/*}/starship.toml" ]]; then
    src="${BASH_SOURCE[0]%/*}/starship.toml"
    cp "$src" "$dest"
    echo "Installed config from repo copy -> $dest"
  else
    curl -fsSL "$REPO_RAW" -o "$dest"
    echo "Installed config from GitHub -> $dest"
  fi
}

# Append init once; skip if already present.
ensure_init() {
  local rc="$1" shell_name="$2" init_line="$3"

  if [[ ! -e "$rc" ]]; then
    # Only create an rc if that shell is actually used / available.
    if ! command -v "$shell_name" >/dev/null 2>&1; then
      echo "Skipping $rc ($shell_name not installed)"
      return 0
    fi
    touch "$rc"
  fi

  if grep -Fq 'starship init' "$rc" 2>/dev/null; then
    echo "Already configured: $rc"
    return 0
  fi

  {
    echo ""
    echo "$MARKER"
    echo "$init_line"
  } >>"$rc"
  echo "Updated $rc"
}

detect_targets() {
  # Prefer explicit arg: bash | zsh | both (default: both that exist)
  local mode="${1:-both}"
  case "$mode" in
    bash) echo bash ;;
    zsh) echo zsh ;;
    both|"")
      local out=()
      command -v bash >/dev/null 2>&1 && out+=(bash)
      command -v zsh >/dev/null 2>&1 && out+=(zsh)
      # Fall back to $SHELL if somehow neither is on PATH
      if ((${#out[@]} == 0)); then
        case "${SHELL:-}" in
          */bash) out+=(bash) ;;
          */zsh) out+=(zsh) ;;
          *) die "neither bash nor zsh found; pass bash or zsh explicitly" ;;
        esac
      fi
      printf '%s\n' "${out[@]}"
      ;;
    *) die "usage: $0 [bash|zsh|both]" ;;
  esac
}

main() {
  local mode="${1:-both}" shell

  need_starship
  install_config

  while IFS= read -r shell; do
    case "$shell" in
      bash) ensure_init "$HOME/.bashrc" bash 'eval "$(starship init bash)"' ;;
      zsh) ensure_init "$HOME/.zshrc" zsh 'eval "$(starship init zsh)"' ;;
    esac
  done < <(detect_targets "$mode")

  echo
  echo "Done. Open a new terminal (or: source ~/.bashrc / source ~/.zshrc)."
  echo "Use a non-Mono Nerd Font so OS icons render at full size."
}

main "$@"
