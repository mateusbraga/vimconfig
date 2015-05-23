# My Vim configuration repository

I use [gmarik/vundle](http://github.com/gmarik/vundle) to manage my plugins.

Lately, I have been using vim for Go and C.

---

# Installing

    cd
    git clone --recursive https://github.com/mateusbraga/vimconfig
    ln -s vimconfig/.vim .vim
    ln -s vimconfig/.vimrc .vimrc
    vim +PluginInstall +qall
    vim +GoInstallBinaries +qall

Compile YouCompleteMe - See [https://github.com/Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
