dotfiles=$HOME/code/dotfiles

prepend_zshrc_to_existing () {
  mv $HOME/.zshrc temp
  echo "source $dotfiles/zshrc" >| $HOME/.zshrc
  cat temp >> $HOME/.zshrc
  rm temp
}

append_gitconfig_to_existing () {
  printf "\n" >> $HOME/.gitconfig
  cat $dotfiles/gitconfig >> $HOME/.gitconfig
}

# dein - neovim plugin manager
setup_dein () {
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $dotfiles/installer.sh
  local dein_bundle_dir=$HOME/.vim/bundle

  [[ ! -d $dein_bundle_dir ]] && mkdir -p $dein_bundle_dir

  sh $dotfiles/installer.sh $dein_bundle_dir
  rm $dotfiles/installer.sh
}

setup_neovim () {
  # create neovim config directory, if it doesn't exist
  local nvim_cfg_dir=$HOME/.config/nvim
  [[ ! -d $nvim_cfg_dir ]] && mkdir -p $nvim_cfg_dir

  echo "source $dotfiles/vim/init.vim" >! $nvim_cfg_dir/init.vim
  echo "source $dotfiles/vim/vimrc" >! $HOME/.vimrc
}
