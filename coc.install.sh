  #!/bin/sh
  # for vim8
  mkdir -p ~/.vim/pack/coc/start
  cd ~/.vim/pack/coc/start
  curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
  # for neovim
  #mkdir -p ~/.local/share/nvim/site/pack/coc/start
  #cd ~/.local/share/nvim/site/pack/coc/start
  #curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
