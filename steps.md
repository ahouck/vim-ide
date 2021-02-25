##Steps to create UI - iTerm 2

1. Install `fish`
  brew install fish
  
2. Install oh-my-fish
  curl -L https://get.oh-my.fish | fish
 
3. Install bobthefish theme
  omf install bobthefish
  
4. ~~Install Solarized terminal theme~~
  ~~http://ethanschoonover.com/solarized/files/solarized.zip~~
  
  Issues with solarized, switched to solarized8 
  https://vimawesome.com/plugin/solarized-8
  
  git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8
  
  
 .vimrc
```   
   set background=dark
   colorscheme solarized8
   g:solarized_termtrans=1
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 ```
  
  Terminal needs to be true color, using iterm2
  Set terminal AND vim to solarized
  
Typescript syntax highlighting ? not sure if this does anything yet
`git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim`

5. Powerline Fonts
  git clone https://github.com/powerline/fonts.git
  cd fonts
  ./install.sh
  
6. Set terminal default theme as Solarize (should be current)
   Set terminal default opacity 50%
   Set terminal default font Ubuntu Mono derivitive Powerline 11pt
   
interactive powerline https://www.freecodecamp.org/news/jazz-up-your-bash-terminal-a-step-by-step-guide-with-pictures-80267554cb22/

powerline daeomn start /Users/USERNAME/Library/Python/3.8/bin

//Background RGB = 13,36,42

##Actual VIM IDE portion

1. Make sure running vim 8.0 + 

#Plugins 
  1. ALE -- ale.install.sh
  2. COC -- coc.install.sh
    a. place coc-settings.json in ~/.vim/coc-settings.json
    b. run ":CocInstall coc-tsserver" and :CocInstall coc-eslint"
  3. FZF -- fzf.install.sh, seems to be small issue with fish?
    a. Also useful in terminal outside of vim
  4. Vim-Rooter - Looks up for .git and sets working directory.
