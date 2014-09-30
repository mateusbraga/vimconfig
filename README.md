My Vim configuration repository.

I use [gmarik/vundle](http://github.com/gmarik/vundle) to organize my plugins.

Lately, I have been using vim for C and Go.

---

What to do:

    cd
    git clone --recursive https://github.com/mateusbraga/vimconfig
    ln -s vimconfig/.vim .vim
    ln -s vimconfig/.vimrc .vimrc
    vim +PluginInstall +qall

Install gocode (assuming $GOPATH/bin is in $PATH)

    go get -u github.com/nsf/gocode

Compile YouCompleteMe - See [https://github.com/Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
