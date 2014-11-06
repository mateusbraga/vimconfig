" Author: Mateus Braga
" https://github.com/mateusbraga/vim_mab/
"
" You will need to compile YouCompleteMe core. See the plugin page

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle - required!
Plugin 'gmarik/vundle'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'mateusbraga/vim-spell-pt-br'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/sudo.vim'
Plugin 'dgryski/vim-godef'
Plugin 'jnwhiteh/vim-golang'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'Townk/vim-autoclose'

call vundle#end()
filetype plugin indent on


syntax on

set spellfile=~/.vim/spell/en.utf-8.add

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change the mapleader from \ to ,
let mapleader=","
let maplocalleader="\\"

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :
nnoremap <leader>; ;
command! W :w

" Avoid accidental hits of <F1> while aiming for <Esc>
noremap! <F1> <Esc>

" Close buffer on <leader>q
nnoremap <leader>q :call MyBufferDelete()<CR>

function! MyBufferDelete()
    if (len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1)
        q
    else
        bd
    endif
endfunction

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Write - sudo
cnoremap w!! w !sudo tee % >/dev/null

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Easier moving
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h
nnoremap <leader>w <C-w>v<C-w>l

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" Quick yanking to the end of the line
nnoremap Y y$

" Yank/paste to the OS clipboard with ,y and ,p
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Edit the todo.txt file
nnoremap <silent> <leader>et :e ~/todo.txt<CR>

" Edit the ultisnips filetype snippets
nnoremap <silent> <leader>es :let UltiSnipsEditSplit='vertical' \| UltiSnipsEdit<CR>

" Clears the search register
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Pull word under cursor into LHS of a substitute (for quick search and
" replace)
nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" Conflict markers {{{
" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" shortcut to jump to next conflict marker
nnoremap <silent> <leader>x /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>
" }}}

inoremap <F2> <C-R>=strftime("%F %T%z")<CR>

nnoremap <F3> :bprevious<CR>
nnoremap <F4> :bnext<CR>
vnoremap <F3> <ESC>:bprevious<CR>
vnoremap <F4> <ESC>:bnext<CR>

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle show/hide invisible chars
"nnoremap <leader>i :set list!<cr>

" Toggle line numbers
"nnoremap <leader>N :setlocal number!<cr>

" Use normal regex
nnoremap / /\v
vnoremap / /\v

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" }}}

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme desert          " How each default identifier look on vim
"if exists("&colorcolumn")
    "set colorcolumn=75
"endif
set termencoding=utf-8
set encoding=utf-8
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)

set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class,*.test,*.aux

set title                       " change the terminal's title
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
set cursorline                  " underline the current line, for quick orientation

set number                      " always show line numbers

set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop

set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set ignorecase
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise


set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)

"set virtualedit=all             " allow the cursor to go in to "invalid" places

set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set formatoptions-=o " don't start new lines w/ comment leader on pressing 'o'
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)
set nrformats=                  " make <C-a> and <C-x> play well with
                                "    zero-padded numbers (i.e. don't consider
                                "    them octal or hex)

set nostartofline           " Avoid moving cursor to BOL when jumping around
set linebreak               " don't wrap textin the middle of a word

set fileformats="unix,dos,mac"

set showmatch                   " set show matching parenthesis
set matchpairs+=<:>         " show matching <> (html mainly) as well

set winminheight=0          " windows can be 0 line high

set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set whichwrap=b,s,h,l,<,>,[,]  " backspace and cursor keys wrap to

set scrolljump=5            " lines to scroll when cursor leaves screen
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling

set visualbell

set confirm                 " Y-N-C prompt if closing with unsaved changes.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins {{{

" TagList settings {{{
nnoremap <leader>l :TlistToggle<CR>

" quit Vim when the TagList window is the last open window
let Tlist_Exit_OnlyWindow=1         " quit when TagList is the last open window
let Tlist_GainFocus_On_ToggleOpen=1 " put focus on the TagList window when it opens
"let Tlist_Process_File_Always=1     " process files in the background, even when the TagList window isn't open
"let Tlist_Show_One_File=1           " only show tags from the current buffer, not all open buffers
let Tlist_WinWidth=40               " set the width
let Tlist_Inc_Winwidth=1            " increase window by 1 when growing

" shorten the time it takes to highlight the current tag (default is 4 secs)
" note that this setting influences Vim's behaviour when saving swap files,
" but we have already turned off swap files (earlier)
"set updatetime=1000

" show function/method prototypes in the list
let Tlist_Display_Prototype=1

" don't show scope info
let Tlist_Display_Tag_Scope=0

" show TagList window on the right
let Tlist_Use_Right_Window=1

" }}}

" Ctrlp {{{

"Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" }}}

" Syntastic {{{
if exists('*SyntasticStatuslineFlag')
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
endif
" }}}

" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}

" Ack {{{
nmap <leader>a <Esc>:Ack 
set grepprg=ack         " replace the default grep program with ack
" }}}

" Filetype specific handling {{{
" only do this part when compiled with support for autocommands
if has("autocmd")
    augroup invisible_chars "{{{
        au!

        " Show invisible characters in all of these files
        autocmd FileType vim setlocal list
        autocmd FileType python,rst setlocal list
        autocmd FileType ruby setlocal list
        autocmd FileType javascript,css setlocal list
    augroup end "}}}

    augroup vim_files "{{{
        au!

        " Display vim help with <C-]>
        autocmd FileType vim noremap <buffer> <C-]> <Esc>:help <C-r><C-w><CR>

        autocmd FileType vim set formatoptions-=o
                                " somehow, during vim filetype detection, this gets set
                                " for vim files, so explicitly unset it again
    augroup end "}}}

    augroup txt_files "{{{
        au!

        autocmd BufRead,BufNewFile *.txt setlocal filetype=txt
        autocmd FileType txt setlocal wrap
        autocmd FileType txt setlocal textwidth=72
        autocmd FileType txt setlocal spell
        autocmd FileType txt setlocal spelllang=en,pt_br
    augroup end "}}}

    augroup rst_files "{{{
        au!

        autocmd BufRead,BufNewFile *.rst setlocal filetype=rst
        autocmd FileType rst setlocal wrap
        autocmd FileType rst setlocal textwidth=74
        autocmd FileType rst setlocal spell
        autocmd FileType rst setlocal spelllang=en,pt_br
    augroup end "}}}

    augroup python_files "{{{
        au!

        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
        " earlier, as it is important)
        autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
        autocmd FileType python setlocal textwidth=78
        autocmd FileType python match ErrorMsg '\%>120v.\+'

        " But disable autowrapping as it is super annoying
        autocmd FileType python setlocal formatoptions-=t

        " Python runners
        autocmd FileType python noremap <buffer> <F5> :w<CR>:!python %<CR>
        autocmd FileType python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
        autocmd FileType python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
        autocmd FileType python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

        " Automatic insertion of breakpoints
        autocmd FileType python nnoremap <buffer> <leader>bp :normal Oimport pdb; pdb.set_trace() ### XXX BREAKPOINT<Esc>

        " Automatic insertion of embedded IPython
        autocmd FileType python nnoremap <buffer> <leader>bi :normal Oimport IPython; IPython.embed() ### XXX IPython interpreter<Esc>

        " Toggling True/False
        autocmd FileType python nnoremap <silent> <C-t> mmviw:s/True\\|False/\={'True':'False','False':'True'}[submatch(0)]/<CR>`m:nohlsearch<CR>

        " Run a quick static syntax check every time we save a Python file
        " autocmd BufWritePost *.py call Flake8()
    augroup end " }}}

    augroup go_files "{{{ golang
        au!

        autocmd FileType go noremap <buffer> <F5> :w<CR>:!go install ./...<CR>
        autocmd FileType go inoremap <buffer> <F5> <Esc>:w<CR>:!go install ./...<CR>
        autocmd FileType go noremap <buffer> <S-F5> :w<CR>:!go run %<CR>
        autocmd FileType go inoremap <buffer> <S-F5> <Esc>:w<CR>:!go run %<CR>
        autocmd FileType go noremap <buffer> <F7> :w<CR>:!go test ./...<CR>

        autocmd FileType go noremap <buffer> <F8> :Fmt<CR>
        autocmd FileType go inoremap <buffer> <F8> <Esc>:Fmt<CR>

        "autocmd FileType go let b:delimitMate_matchpairs = "(:),[:],{:}"
        autocmd FileType go let g:gofmt_command ='goimports'
        "autocmd FileType go au BufWritePre <buffer> Fmt

    augroup end " }}}

    augroup markdown_files "{{{
        au BufRead,BufNewFile *.md set filetype=markdown
    augroup end " }}}

    augroup latex_files "{{{
        au!

        autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
        autocmd FileType tex,bib noremap <buffer> <F5> :w<CR>:!make<CR>
        autocmd FileType tex,bib setlocal spell
        "autocmd FileType tex,bib setlocal spelllang=pt_br,en
        autocmd FileType tex,bib setlocal spelllang=pt,en
        "autocmd BufWritePost *.tex :!latexmk -pdf

        autocmd FileType tex syn region texZone      start="\\begin{verbatim}"           end="\\end{verbatim}\|%stopzone\>"  contains=@Spell
        autocmd FileType tex syn region texZone      start="\\begin{code}"               end="\\end{code}\|%stopzone\>"  contains=@Spell
        " listings package:
        autocmd FileType tex syn region texZone      start="\\begin{lstlisting}"         end="\\end{lstlisting}\|%stopzone\>"    contains=@NoSpell
        " moreverb package:
        autocmd FileType tex syn region texZone      start="\\begin{verbatimtab}"        end="\\end{verbatimtab}\|%stopzone\>"   contains=@Spell
        autocmd FileType tex syn region texZone      start="\\begin{verbatimwrite}"      end="\\end{verbatimwrite}\|%stopzone\>" contains=@Spell
        autocmd FileType tex syn region texZone      start="\\begin{boxedverbatim}"      end="\\end{boxedverbatim}\|%stopzone\>" contains=@Spell
    augroup end " }}}
endif
" }}}
