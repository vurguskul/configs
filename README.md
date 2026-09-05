# configs

Personal dotfiles for a terminal-centric development setup: **tmux** and **Vim**,
plus a small installer that symlinks them into `$HOME`.

## Contents

| File            | Purpose |
|-----------------|---------|
| `tmux.conf`     | tmux configuration (targets tmux 3.0+) |
| `vimrc`         | Vim configuration, managed with Vundle |
| `setup.sh`      | Backs up existing dotfiles, symlinks these into `$HOME`, installs plugin managers |

## Install

```bash
git clone <this-repo> ~/configs
cd ~/configs
./setup.sh
```

`setup.sh` will:

1. Move any existing `~/.tmux.conf` / `~/.vimrc` aside to `*_bak`.
2. Symlink `tmux.conf` → `~/.tmux.conf` and `vimrc` → `~/.vimrc`.
3. Clone [Vundle](https://github.com/VundleVim/Vundle.vim) into `~/.vim/bundle/Vundle.vim`.
4. Clone [tpm](https://github.com/tmux-plugins/tpm) into `~/.tmux/plugins/tpm`.

### Finish setup

- **Vim plugins:** open Vim and run `:PluginInstall`. `YouCompleteMe` needs a
  separate compile step (`~/.vim/bundle/YouCompleteMe/install.py`).
- **tmux plugins:** start tmux and press `prefix + I` (prefix is `C-a`) to have
  tpm fetch the plugins.

## tmux highlights

- Prefix remapped from `C-b` to **`C-a`**.
- Split panes with `prefix + \` (horizontal) and `prefix + -` (vertical); new
  panes/windows inherit the current pane's directory.
- `Alt + arrows` to move between panes, `Ctrl+Alt + Left/Right` to switch windows,
  `Alt+Shift + arrows` to resize.
- Mouse mode on, `vi` copy/status keys, 10k-line history.
- `prefix + r` reloads the config.
- Plugins: `tmux-sensible`, `tmux-resurrect`, `tmux-continuum` (auto restore of
  sessions, panes, and shell history), `tmux-colors-solarized` (dark).

## vimrc highlights

- Vundle-managed plugins including `vim-colorschemes`, `plantuml-syntax` /
  `vim-slumlord`, and a Python stack (`indentpython`, `syntastic`, `vim-flake8`,
  `YouCompleteMe`).
- 2-space indentation, `expandtab`, line numbers, 256-color forced,
  system clipboard (`unnamedplus`).
- `colorscheme ron`.
- `Jenkinsfile` is treated as Groovy syntax.
- Register macros for editing C/C++ includes:
  - `@l` — convert `"header.h"` to `<header.h>` on the current line.
  - `@g` — convert `<header.h>` back to `"header.h"`.

## Notes

- No shell (`bashrc`/`zshrc`) or Git config is included.
