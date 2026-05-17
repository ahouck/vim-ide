# vim-ide

Personal Vim + tmux configuration for a terminal-based development experience,
primarily targeting TypeScript / React / Node projects.

## What's in here

| File                  | Purpose                                                   |
| --------------------- | --------------------------------------------------------- |
| `.vimrc`              | Vim 9 config: vim-plug bootstrap, plugins, keymaps        |
| `.tmux.conf`          | Minimal tmux config (256-color terminal)                  |
| `config.fish`         | fish config: EDITOR, aliases, fzf, bobthefish settings    |
| `coc-settings.json`   | CoC settings (goes to `~/.vim/coc-settings.json`)         |
| `ide.sh`              | tmux pane layout helper                                   |
| `iterm2_profile.json` | iTerm2 profile (Solarized Dark + Ubuntu Mono Powerline)   |
| `steps.md`            | First-time setup walkthrough                              |

## Quick install

```sh
# Prereqs
brew install vim tmux fzf ripgrep node fish

# fish + oh-my-fish + bobthefish
curl -sL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fish -c "omf install bobthefish"
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells && chsh -s /opt/homebrew/bin/fish

# Symlink configs
ln -sf "$PWD/.vimrc"       ~/.vimrc
ln -sf "$PWD/.tmux.conf"   ~/.tmux.conf
ln -sf "$PWD/config.fish"  ~/.config/fish/config.fish
mkdir -p ~/.vim
ln -sf "$PWD/coc-settings.json" ~/.vim/coc-settings.json

# Launch vim; vim-plug auto-installs on first run, then run :PlugInstall if needed
vim
```

CoC extensions (`coc-tsserver`, `coc-eslint`) are installed automatically via
`g:coc_global_extensions` on first vim startup.

## Plugins

Managed entirely through [vim-plug](https://github.com/junegunn/vim-plug):

- `junegunn/fzf` + `junegunn/fzf.vim` — fuzzy finding
- `sheerun/vim-polyglot`, `peitalin/vim-jsx-typescript` — syntax
- `vim-airline/vim-airline` (+ themes) — status line
- `preservim/nerdtree` — file tree
- `lifepillar/vim-solarized8` — colorscheme
- `tpope/vim-surround` — quote/paren manipulation
- `airblade/vim-rooter` — auto-cd to project root
- `neoclide/coc.nvim` — LSP + completion
- `dense-analysis/ale` — linting + Prettier on save
