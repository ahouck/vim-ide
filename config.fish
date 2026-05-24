# Homebrew (Apple Silicon)
set -x PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

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

# Open IDE layout in current directory (tmux panes + vim)
function ide
    if not set -q TMUX
        # Not inside tmux — start a new session with the IDE layout
        tmux new-session -d -s ide
        tmux send-keys -t ide "cd $(pwd) && ~/projects/vim-ide/ide.sh && vim ." Enter
        tmux attach-session -t ide
    else
        # Already inside tmux — just split and open vim
        ~/projects/vim-ide/ide.sh
        vim .
    end
end

# fzf keybindings
fzf --fish | source
