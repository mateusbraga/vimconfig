" https://github.com/mateusbraga/vim_mab/
" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pep8 - http://pypi.python.org/pypi/pep8
" Pyflakes
" Ack
" Rake & Ruby for command-t
" nose, django-nose

" ==========================================================
" Plugins included
" ==========================================================
" Ack
"       A replacement for 99% of the uses of grep
" Addon-mw-utils
"       Used by others plugins: get some information from files and cache it.
"
" Afterimage
"       'Edit ICO, PNG and GIF icons' converting to plain text
"
" C.vim (C-support)
"       Turn Vim into a C IDE.
"
" DelimitMate
"       Automatic closing of quotes, parenthesis, brackets, etc.
"
" endwise
"       Helps to end certain structures automatically (end after if) ...
"
" fugitive
"       A Git wrapper
"
" FuzzyFinder
"       Searches with the fuzzy/partial pattern a buffer/file/command/...
"
" GunDo
"       Visual Undo in vim with diff's to check the differences
"
" HTML-AutoCloseTag
"       Automatically closes HTML tag once you finish typing it with >.
"
" matchit
"       Extended matching with "%"
"
" minibufexpl
"       Show buffers as tabs.
"
" nerdcommenter
"       Provides many different commenting operations and styles via key
"
" nerdtree
"       Explore filesystem.
"
" Pathogen
"     Better Management of VIM plugins
"
" python-mode
"     Great python stuff
"
" ragtag
"    Mappings for XML/XHTML.
"
" repeat
"    Permits using the '.' to redo a command after a plugin map.
"
" Ruby
"     Editing and compiling ruby within vim.
"
" SearchComplete
"     Tab-complete words while typing in a search.
"
" ShowMarks
"     Provides a visual representation of the location marks.
"
" Snipmate and snipmate-snippets
"     Configurable snippets to avoid re-typing common comands
"
" speeddating
"     Use CTRL-A/CTRL-X to increment dates, times, and more.
"
" SQLComplete
"     Completion for the SQL language.
"
" supertab
"     Allows you to perform all your insert completion using the tab key
"
" Surround
"    Allows you to surround text with open/close tags
"
" Syntastic
"    Syntax cheking plugin that runs files through external syntax checkers.
"
" Taglist
"    Provides an overview of the structure of souce code files and allows you
"    to efficiently browse through it.
"
" Tasklist
"    Search the file for FIXME, TODO, and XXX
"
" tlib_vim
"    Provides some utility functions
"
" vsccomand
"    Useful for manipulating files controlled by CVS, SVN, SVK, git, bzr, and
"    hg within VIM.
"
" ==========================================================
" Shortcuts
" ==========================================================
" Environment {
set nocompatible    " must be first line

" Windows Compatible {
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
" }

" Setup Bundle Support {
" The next two lines ensure that the ~/.vim/bundle/ system works
call pathogen#infect()
call pathogen#helptags()
" }

" General {
filetype on                 " Automatically detect file types.
filetype plugin on          " Automatically load plugins of file types.
filetype plugin indent on   " Automatically indent file types.
syntax on                   " syntax highlighting
