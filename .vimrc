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
" pep8
"     Checks if it's pep8 conformed.
"
" Piv
"     Turn vim into a PHP IDE.
"
" Pydoc
"    Opens up pydoc within vim
"
" Py.test
"    Run py.test test's from within vim
"
" ragtag
"    Mappings for XML/XHTML.
"
" repeat
"    Permits using the '.' to redo a command after a plugin map.
"
" rope-vim
"     vim mode that uses rope_ library to provide features like python
"     refactorings and code-assists.
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

" }

" General {
filetype on                 " Automatically detect file types.
filetype plugin on          " Automatically load plugins of file types.
filetype plugin indent on   " Automatically indent file types.
syntax on                   " syntax highlighting
set mouse=a                 " automatically enable mouse usage
scriptencoding utf-8        " Set enconding to utf-8.
set history=1000            " Number of options in the history (arrow up and down)
set backup                  " Create backup (~) file



" VIM UI {
colorscheme desert          " How each default identifier look on vim
set tabpagemax=15           " Max number of tab pages to be opened
set title                   " show title in console title bar
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word

set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth

set matchpairs+=<:>         " show matching <> (html mainly) as well

set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set foldenable              " auto fold code

set winminheight=0          " windows can be 0 line high

set wildmenu                " show list instead of just completing
set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.

set whichwrap=b,s,h,l,<,>,[,]  " backspace and cursor keys wrap to
set scrolljump=5            " lines to scroll when cursor leaves screen

set cursorline              " have a line indicate the cursor location
hi CursorLine term=bold cterm=bold guibg=Grey40 "Make line bold instead of underlining

if version >= 720
    set colorcolumn=79
endif

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set laststatus=2            " Always show statusline, even if only 1 window.
"set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
set gdefault                " the /g flag on :s substitutions by default

" }
" (re)Mappings {
inoremap # # " don't outdent hashes
"
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Key (re)Mappings {
let mapleader = ','                " use ',' as the leader instead of '\'

nnoremap <leader>. :lcd %:p:h<CR>                 " Set working directory

map Q gq

nmap <leader>p "+p                                " Paste from clipboard

nnoremap <leader>q :bd<CR>                   " Close buffer on <leader>q

nnoremap <leader><space> :nohlsearch<cr>  " hide matches on <leader>space

nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR> " Remove trailing whitespace on <leader>S TODO_FORMAT 

command! W :w " Seriously, guys. It's not like :W is bound to anything anyway.

nnoremap ; : " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.

" Easier moving
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" F2 {
" Normal: Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" Insert: timestamp in Insert Mode
imap <F2> <C-R>=strftime("%F %T%z")<CR>
" }

nmap <F3> :bprevious<CR>
nmap <F4> :bnext<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Split vertically {
nmap <leader>sb :vsplit<CR>

""" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" }

" Plugins {

" Supertab {
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" }

" Ack {
set grepprg=ack         " replace the default grep program with ack
" }

" Misc {
:map <C-F10> <Esc>:vsp<CR>:VTree<CR>
" map Control + F10 to Vtree

noremap <leader><F5> :CheckSyntax<cr>
let g:checksyntax_auto = 1

"comment out line(s) in visual mode -RB: If you do this, you can't
"switch sides of the comment block in visual mode.
"vmap  o  :call NERDComment(1, 'toggle')<CR>
let g:NERDShutUp=1

let b:match_ignorecase = 1
" }

" ShowMarks {
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Don't leave on by default, use :ShowMarksOn to enable
let g:showmarks_enable = 0
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
" }

" OmniComplete {
"if has("autocmd") && exists("+omnifunc")
"autocmd Filetype *
"\if &omnifunc == "" |
"\setlocal omnifunc=syntaxcomplete#Complete |
"\endif
"endif

" and make sure that it doesn't break supertab
let g:SuperTabCrMapping = 0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest
" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }

" Ctags {
" This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set tags=./tags;/,$HOME/vimtags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " C-\ - Open the definition in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>      " A-] - Open the definition in a vertical split
" }

" Delimitmate {
au FileType * let b:delimitMate_autoclose = 1
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"

" If using html auto complete (complete closing tag)
au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
" }

" Task list - Toggle the tasklist {
map <leader>td <Plug>TaskList
"}


if exists('*SyntasticStatuslineFlag')
    " Syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " }
endif

" NerdTree {
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
" }

" Buffer explorer {
nmap <leader>b :BufExplorer<CR>
" }

" VCS commands {
nmap <leader>vs :vcsstatus<cr>
nmap <leader>vc :vcscommit<cr>
nmap <leader>vb :vcsblame<cr>
nmap <leader>va :vcsadd<cr>
nmap <leader>vd :vcsvimdiff<cr>
nmap <leader>vl :vcslog<cr>
nmap <leader>vu :vcsupdate<cr>
" }

" Debugging with VimDebugger {
map <F11> :DbgStepInto<CR>
map <F10> :DbgStepOver<CR>
map <S-F11> :DbgStepOut<CR>
map <F5> :DbgRun<CR>
map <F6> :DbgDetach<CR>
map <F8> :DbgToggleBreakpoint<CR>
map <S-F8> :DbgFlushBreakpoints<CR>
map <F9> :DbgRefreshWatch<CR>
map <S-F9> :DbgAddWatch<CR>

" }

" Gundo {
map <leader>g :GundoToggle<CR>
"}

" Pep8 {
let g:pep8_map='<leader>8'
" }

" Pydoc {
set completeopt=menuone,longest,preview
" }

" Rope {
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
"}

" Ack {
nmap <leader>a <Esc>:Ack!
" }


" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufNewFile,BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Text
au BufNewFile,BufRead *.txt set wrap | set tw=79 | set wm=2


" Python Code {
if has('python')
    " Add the virtualenv's site-packages to vim path
    " py << EOF
    " import os.path
    " import sys
    " import vim
    " if 'VIRTUALENV' in os.environ:
    " project_base_dir = os.environ['VIRTUAL_ENV']
    " sys.path.insert(0, project_base_dir)
    " activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    " execfile(activate_this, dict(__file__=activate_this))
    " EOF
    " Load up virtualenv's vimrc if it exists
    " if filereadable($VIRTUAL_ENV . '/.vimrc')
    " source $VIRTUAL_ENV/.vimrc
    " endif
endif
" }

