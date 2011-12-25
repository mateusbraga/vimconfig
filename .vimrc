
" Environment {
	" Basics {
		set nocompatible 	" must be first line
		"set background=dark     " Assume a dark background
	" }

	" Windows Compatible {
		" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
		" across (heterogeneous) systems easier. 
		if has('win32') || has('win64')
		  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		endif
	" }
    " 
	" Setup Bundle Support {
	" The next two lines ensure that the ~/.vim/bundle/ system works
		call pathogen#infect()
		call pathogen#helptags()
	" }

" }

" General {
    filetype on  	" Automatically detect file types.
    filetype plugin on  	" Automatically detect file types.
    filetype plugin indent on  	" Automatically detect file types.
    syntax on 					" syntax highlighting
    set mouse=a					" automatically enable mouse usage
    "set autochdir 				" always switch to the current file directory.. Messes with some plugins, best left commented out
    " not every vim is compiled with this, use the following line instead
    " If you use command-t plugin, it conflicts with this, comment it out.
    "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    scriptencoding utf-8

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore 	   	" allow for cursor beyond last character
    set history=1000  				" Store a ton of history (default is 20)
    
	" Setting up the directories {
		set backup 						" backups are nice ...
		set undofile					" so is persistent undo ...
		set undolevels=1000 "maximum number of changes that can be undone
		set undoreload=10000 "maximum number lines to save for undo on a buffer reload
        " Moved to function at bottom of the file
		"set backupdir=$HOME/.vimbackup//  " but not when they clog .
		"set directory=$HOME/.vimswap// 	" Same for swap files
		"set viewdir=$HOME/.vimviews// 	" same for view files
		
		"" Creating directories if they don't exist
		"silent execute '!mkdir -p $HVOME/.vimbackup'
		"silent execute '!mkdir -p $HOME/.vimswap'
		"silent execute '!mkdir -p $HOME/.vimviews'
		au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
	" }
" }

" VIM UI {
    colorscheme desert
    set tabpagemax=15
    set showmode

    set cursorline

    if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids

    set showcmd                " show partial commands in status line and
            " selected characters/lines in visual mode
    endif
    
    if has('statusline')
    set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start	" backspace for dummys
    set linespace=0					" No extra spaces between rows
    set number
    " Toggle line numbers and fold column for easy copying:
    nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

    set showmatch					" show matching brackets/parenthesis
    set incsearch					" find as you type search
    set hlsearch					" highlight search terms
    set winminheight=0				" windows can be 0 line high 
    set ignorecase					" case insensitive search
    set smartcase					" case sensitive when uc present
    set wildmenu					" show list instead of just completing
    set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
    set scrolljump=5 				" lines to scroll when cursor leaves screen
    set scrolloff=3 				" minimum lines to keep above and below cursor
    set foldenable  				" auto fold code
    set gdefault					" the /g flag on :s substitutions by default
" }

" Formatting {
    set nowrap                     	" wrap long lines
    set autoindent                 	" indent at the same level of the previous line
    set shiftwidth=4               	" use indents of 4 spaces
    set expandtab 	  	     		" tabs are spaces, not tabs
    set tabstop=4 					" an indentation every four columns
    set softtabstop=4 				" let backspace Delete indent
    "set matchpairs+=<:>            	" match, to be used with % 
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :


    " Easier moving in tabs and windows
    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l
    map <C-H> <C-W>h
    
    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " The following two lines conflict with moving to top and bottom of the
    " screen
    " If you prefer that functionality, comment them out.
    map <S-H> gT          
    map <S-L> gt

    " Stupid shift key fixes
    cmap W w 						
    cmap WQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    "nnoremap Y y$
        
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

    "clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv 

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0
        
    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null
" }

" Plugins {

    " Supertab {
        let g:SuperTabDefaultCompletionType = "context"
        "let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
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
    
        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,preview,longest
    " }
    
    " Ctags {
    " This will look in the current directory for 'tags', and work up the tree towards root until one is found. 
        set tags=./tags;/,$HOME/vimtags
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " C-\ - Open the definition in a new tab
    map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>      " A-] - Open the definition in a vertical split
    " }
    " Delimitmate {
        au FileType * let b:delimitMate_autoclose = 1

        " If using html auto complete (complete closing tag)
    au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
    " }
    
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
    nmap <leader>vs :VCSStatus<CR>
    nmap <leader>vc :VCSCommit<CR>
    nmap <leader>vb :VCSBlame<CR>
    nmap <leader>va :VCSAdd<CR>
    nmap <leader>vd :VCSVimDiff<CR>
    nmap <leader>vl :VCSLog<CR>
    nmap <leader>vu :VCSUpdate<CR>
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

    " Pyflakes {
    "let g:pyflakes_use_quickfix = 0
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



" Python {
    autocmd FileType python set foldmethod=indent foldlevel=99
    au FileType python set omnifunc=pythoncomplete#Complete
"}
