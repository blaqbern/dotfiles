DOTFILES=~/code/dotfiles

# prepend custom zsh config to ~/.zshrc
{echo "source $DOTFILES/zshrc"; cat ~/.zshrc;} >! temp && mv temp ~/.zshrc

# append custom gitconfig to existing ~/.gitconfig
printf "\n" >> ~/.gitconfig
cat $DOTFILES/gitconfig >> ~/.gitconfig

# dein - neovim plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $DOTFILES/installer.sh
sh $DOTFILES/installer.sh ~/.vim/bundle
rm $DOTFILES/installer.sh

# create neovim config directory, if it doesn't exist
if [[ ! -a ~/.config/nvim ]]; then
  mkdir ~/.config/nvim
fi

echo "source $DOTFILES/init.vim" >! ~/.config/nvim/init.vim
echo "source $DOTFILES/init.vim" >! ~/.vimrc

# change colorscheme for vim to distinguish from nvim
echo "colorscheme sierra" >> ~/.vimrc
