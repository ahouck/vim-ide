set -x EDITOR vim
set -x VISUAL vim

alias vi vim
alias v vim

# bobthefish settings
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts no
set -g theme_color_scheme solarized-dark
set -g theme_date_color brblue

# fish autosuggestion ghost text (default brblack is unreadable on dark backgrounds)
set -g fish_color_autosuggestion '777777'

# fzf keybindings
fzf --fish | source
