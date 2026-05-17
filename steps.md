# Setup steps

These are the one-time setup steps for a fresh macOS box.

## 1. Terminal + shell

Using **iTerm2 + fish + oh-my-fish + bobthefish theme**. The included
`iterm2_profile.json` carries the Solarized Dark colorscheme and Ubuntu Mono
derivative Powerline font.

```sh
# Homebrew (if not already)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask iterm2
brew install fish
```

### Powerline fonts

```sh
git clone --depth=1 https://github.com/powerline/fonts.git /tmp/fonts
/tmp/fonts/install.sh
rm -rf /tmp/fonts
```

### oh-my-fish + bobthefish

```sh
curl -sL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fish -c "omf install bobthefish"
```

### Set fish as default shell

```sh
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

Import `iterm2_profile.json` via iTerm2 → Preferences → Profiles → Other
Actions → Import JSON Profiles. This sets the Solarized colors and Powerline
font automatically.

## 2. Vim + dependencies

```sh
brew install vim tmux fzf ripgrep node
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
```

`ripgrep` powers `:Rg` inside vim; `node` is required by CoC.

## 3. Wire up the configs

```sh
# from this repo
ln -sf "$PWD/.vimrc"     ~/.vimrc
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf
mkdir -p ~/.vim
ln -sf "$PWD/coc-settings.json" ~/.vim/coc-settings.json
```

## 4. First vim launch

`vim-plug` bootstraps itself from `.vimrc`. On first launch it will:

1. Download `~/.vim/autoload/plug.vim`
2. Run `:PlugInstall` automatically
3. CoC will install `coc-tsserver` and `coc-eslint` on its own

If anything looks off, run `:PlugInstall` and `:CocUpdate` manually.

## 5. tmux pane layout helper

`ide.sh` splits the current tmux window into editor + two terminal panes:

```sh
tmux new -s dev
./ide.sh
```
