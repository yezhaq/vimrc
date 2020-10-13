set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'Shougo/unite.vim'
"build command-t share lib command: cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/; ruby extconf.rb; make
Plugin 'wincent/command-t'
Plugin 'airblade/vim-gitgutter'
"python autocompletion, need to install jedi library: sudo pip install jedi
Plugin 'davidhalter/jedi-vim'

Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'kshenoy/vim-signature'
Plugin 'google/vim-maktaba'
Plugin 'jlanzarotta/bufexplorer'

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-entire'
Plugin 'glts/vim-textobj-comment'
Plugin 'glts/vim-textobj-indblock'
Plugin 'reedes/vim-textobj-quote'
Plugin 'machakann/vim-textobj-delimited'

"small plugin written by me ^_^
Plugin 'yezhaq/vim-identifier-movement'
Plugin 'yezhaq/vim-reorder-digits'
Plugin 'yezhaq/vim-line-jump'
Plugin 'yezhaq/vim-tab'
Plugin 'yezhaq/nerdtree-plugin-collection'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


"+---------------------------------------------------------------------------+
"|                          begin of vim settting                            |
"+---------------------------------------------------------------------------+
"
syntax enable
filetype plugin indent on

set title
set matchpairs+=":"
set clipboard=unnamed
set wrap
set linebreak
set fileencodings=utf-8,cp936,chinese,latin-1
set ffs=unix,dos,mac

"save 500 files infomation
"save 200 history commnand line  
"save 200 search commnand line  
"save buffer list
set viminfo='500,<500,:200,/200,%15
set autowrite
set hidden              " allows making buffers hidden even with unsaved changes
set history=1000        " remember more commands and search history
set undolevels=1000     " use many levels of undo
set autoread            " auto read when a file is changed from the outside
"turn off swap file
set noswapfile
"auto load modify file
set diffopt=iwhite

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
" XXX not sure
set pastetoggle=<F7>
set nocompatible
set number
"set relativenumber
set hlsearch
set incsearch
set wildmenu
set laststatus=2
" XXX this may affect macro use
set scrolloff=2
"set undofile			" stores undo state even when files are closed (in undodir)
set showmatch           " show matching bracket (briefly jump)
set matchtime=2         " reduces matching paren blink time from the 5[00]ms def
set novisualbell
"set showmatch
set winaltkeys=no "let vim can use windows alt keys
"set cursorline
"set cursorcolumn
highlight CursorLine guibg=blue ctermbg=gray

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
"set wildmode=longest,list,full
set wildmode=list:longest,full
" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest

"fold option
set foldmethod=manual
"set foldenable
"set foldmethod=indent
"set foldlevel=100
"set foldopen-=search
"set foldopen-=undo
"
set shiftwidth=4
"set noexpandtab
"expandtab replace tab with space
set expandtab
set softtabstop=4
set tabstop=4
set sw=4
set cpo=aABceFsJ
set guioptions= "no gui menu, and other
set backspace=indent,eol,start
set comments=://
set cindent
set autoindent!
set smartindent
"smart case when search, when substitute need \C
set ignorecase smartcase
set ruler

"for gitgutter
set updatetime=500

"airline setting
"show current directory
let g:airline_section_a = '%{getcwd()}' "old vim mode(insert | visual | normal ..)
let g:airline_section_b = '' "git branch name
"let g:airline_section_c = 'c' "current file name
let g:airline_section_gutter = ''
"let g:airline_section_warning = ''
"let g:airline_section_x = 'x'
"let g:airline_section_y = 'y'
let g:airline_section_z = ''
let g:airline#extensions#whitespace#enabled = 0

autocmd TerminalOpen terminal call TerminalWin_Enter()

function! TerminalWin_Enter()
    echo "terminal win enter"
    execute NERDTreeClose
    execute TagbarClose
endfunction

function! TerminalWin_Leave()
    echo "terminal win close"
endfunction

autocmd BufWinEnter quickfix call QuickfixWinEnter_event()

"quick fix leave, sometimes bug
command! -nargs=0 QuickfixLeave :call Quickfix_leave_o()

"this fix sometimes tagbar and nerdtree windows width not normal
function! Tagbar_enter()
	exec "vertical resize " . g:Nerdtree_window_enter_width
	"echo "tagbar window enter"
endfunction

function! Tagbar_leave()
	exec "vertical resize " . g:Nerdtree_window_leave_width
	"echo "tagbar window leave"
endfunction

function! Nerdtree_enter()
	exec "vertical resize " . g:Nerdtree_window_enter_width
	"echo "Nerdtree window enter"
endfunction

function! Nerdtree_leave()
	exec "vertical resize " . g:Nerdtree_window_leave_width
	"echo "Nerdtree window leave"
endfunction

"let g:tagbar_autopreview = 1

autocmd BufEnter __Tagbar__ call Tagbar_enter()
autocmd BufLeave __Tagbar__ call Tagbar_leave()
autocmd BufEnter NERD_tree_\d\+ call Nerdtree_enter()
autocmd BufLeave NERD_tree_\d\+ call Nerdtree_leave()
"
"fix quickfix windows position when used with nerdtree
autocmd FileType qf wincmd J

"nerdtree window width
let g:Nerdtree_window_enter_width = 40
let g:Nerdtree_window_leave_width = 40 

" let NERDTreeDirArrowExpandable = "+"
" let NERDTreeDirArrowCollapsible = "+"

let NERDTreeDirArrows=0

let mapleader = ","

"map to stop the highlighting
nnoremap <leader>h :noh<cr>
"map to quit
nnoremap <leader>q :q<cr>

noremap <silent> <expr> j (v:count == 0?'gj':'j')
noremap <silent> <expr> k (v:count == 0?'gk':'k')

"{{{
"make <c-y> in insert mode insert word above

"insert mode insert word above
"insert word above
inoremap <expr> <c-y> GetAboveWord()
function! GetAboveWord()
	"disable neocomplcache
	let save = g:neocomplete#auto_completion_start_length
	let g:neocomplete#auto_completion_start_length = 9999 "never reach this
	"this not work, i don't know why
	"let str = matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\s*\\|.\)')
	let str = matchstr(getline(line('.')-1), '\S\+\s*', col('.')-1)
	let g:neocomplete#auto_completion_start_length = save
	return str
endfunction
"}}}


"move between tabs
if has('nvim')
    nnoremap <A-w> :tabnext <cr>
    nnoremap <A-q> :tabprevious <cr>
    nnoremap <A-a> :call TabSwitchToPrevTab() <cr>
else
    nnoremap w :tabnext <cr>
    nnoremap q :tabprevious <cr>
    nnoremap a :call TabSwitchToPrevTab() <cr>
endif

"quick in tmux
nnoremap <c-d> :q<cr>

"alt key mapping, for my laptop
"windows jump
if has('nvim')
    "normal mode map windows movements
    nnoremap <A-l> <c-w>l
    nnoremap <A-h> <c-w>h
    nnoremap <A-j> <c-w>j
    nnoremap <A-k> <c-w>k
    "move to previous window
    nnoremap <A-n> <c-w>p
    nnoremap <A--> <c-w>_
    nnoremap <A-=> <c-w>=

    "teminal mode map windows movements
    tnoremap <A-l> <c-w>l
    tnoremap <A-h> <c-w>h
    tnoremap <A-j> <c-w>j
    tnoremap <A-k> <c-w>k
    "move to previous window
    tnoremap <A-n> <c-w>p
    "set current windows highest height
    tnoremap <A--> <c-w>_
    tnoremap <A-=> <c-w>=
else
    "normal mode map windows movements
    nnoremap l <c-w>l
    nnoremap h <c-w>h
    nnoremap j <c-w>j
    nnoremap k <c-w>k
    "move to previous window
    nnoremap n <c-w>p
    "set current windows highest height
    nnoremap - <c-w>_
    "make each window equally high and wide
    nnoremap = <c-w>=

    "teminal mode map windows movements
    tnoremap l <c-w>l
    tnoremap h <c-w>h
    tnoremap j <c-w>j
    tnoremap k <c-w>k
    "move to previous window
    tnoremap n <c-w>p
    "set current windows highest height
    tnoremap - <c-w>_
    "make each window equally high and wide
    tnoremap = <c-w>=
endif

"esc key mapping,<c-[> suffers me
"normal
nnoremap <c-k> <esc>
"command line
cnoremap <c-k> <c-c>
"visual and select
vnoremap <c-k> <esc>
"operator-pending
onoremap <c-k> <esc>
"select
snoremap <c-k> <esc>
"visual
xnoremap <c-k> <esc>
"insert
inoremap <c-k> <esc>
"insert, Command-line, Lang-Arg
lnoremap <c-k> <esc>
"noremap <c-k> <esc>

augroup textobj_quote
	autocmd!
	autocmd FileType markdown call textobj#quote#init()
	autocmd FileType textile call textobj#quote#init()
	autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }


"{{{
"NERDTree settings

"filetype open by system 
let g:NERDTree_win_width_hide = 40
let g:NERDTree_win_width_show = 40
let g:NERDTreeMapMenu = "M"
let g:NERDTreeMinimalUI=0
"change vim dir when nerdtree dir change
let g:NERDTreeChDirMode=2
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeIgnore=['\.git$', '\~$','\.svn$']
let g:NERDTreeWinPos='right'
let g:NERDTreeCascadeSingleChildDir=1
let NERDTreeCascadeOpenSingleChildDir=1
"single click open file or directory
let g:NERDTreeMouseMode=3
let g:NERDTreeShowBookmarks=1
let g:NERDTreeAutoDeleteBuffer=1
"}}}

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"{{{
"tags settings

"set global as csopce program
set csprg=gtags-cscope 
set cscopequickfix=g-,s-,c-,d-,i-,t-,e-
set cscopetag

"gtag for jump
command! -nargs=0 GTAG call GenGtag()
function! GenGtag()
	exec "cs kill 0"
	exec "!gtags"
	exec "cs add GTAGS"
endfunction
"}}}

"use tag in current directory
set tags=tags

"{{{
nnoremap <silent> <C-l> :call JumpToNextIndentifier()<cr>
nnoremap <silent> <C-h> :call JumpToPrevIndentifier()<cr>
"}}}

"{{{
"vim-line-jump settings

"default this map is 'f', change it to some key else
"so below 'f' map works when NERDTree first open
let g:NERDTreeMapToggleFilters = "0"
"Ignore case when select
"let g:LineJumpSelectIgnoreCase = 1
let g:LineJumpSelectSmartCase = 1
augroup LineJumpNerdTree
	"I find nerdtree's f map to something not that useful!
	autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> f <ESC>:silent! call LineJumpSelectForward()<cr>
	autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> b <ESC>:silent! call LineJumpSelectBackward()<cr>
	autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> ; <ESC>:silent! call LineJumpMoveForward()<cr>
	"autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> ; <ESC>:call LineJumpMoveForward()<cr>
	autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> , <ESC>:silent! call LineJumpMoveBackward()<cr>
	"autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> , <ESC>:call LineJumpMoveBackward()<cr>

	autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> h <ESC>:silent! call LineJumpMoveTop()<cr>
	autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> gm <ESC>:silent! call LineJumpMoveMiddle()<cr>
	autocmd BufEnter NERD_tree_\d\+ nnoremap <buffer> <nowait> <silent> l <ESC>:silent! call LineJumpMoveBottom()<cr>
augroup END
"LineJump TagBar key map
augroup LineJumpTagbar
	autocmd BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> f <ESC>:silent! call LineJumpSelectForward()<cr>
	autocmd BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> ; <ESC>:silent! call LineJumpMoveForward()<cr>
	autocmd BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> b <ESC>:silent! call LineJumpSelectBackward()<cr>
	autocmd BufEnter __Tagbar__ nnoremap <buffer> <nowait> <silent> , <ESC>:silent! call LineJumpMoveBackward()<cr>

	autocmd BufEnter __Tagbar__.\d nnoremap <buffer> <nowait> <silent> h <ESC>:silent! call LineJumpMoveTop()<cr>
	autocmd BufEnter __Tagbar__.\d nnoremap <buffer> <nowait> <silent> gm <ESC>:silent! call LineJumpMoveMiddle()<cr>
	autocmd BufEnter __Tagbar__.\d nnoremap <buffer> <nowait> <silent> l <ESC>:silent! call LineJumpMoveBottom()<cr>
augroup END
"}}}

"{{{
"vim-tab settings

"set follow option  in your vimrc,Press 't' in NERDTree directory node will open the directory in a new tab,
"and will also sets VIM working directory to that directory node
let g:NERDTreeChDirMode=2

"below is reload GTAGS, ctags demo code.
function! TabReloadCGtag()

	"gnu global produce GTAGS, more useful than cscope
	"check if GTAGS change
	if !filereadable("./GTAGS")
		return
	endif

	let pwd=getcwd()
	let gtags_path=pwd . "/GTAGS"
	"echom gtags_path

	"check if gtags already loaded
	if cscope_connection(2,gtags_path) == 0
		silent execute "cs kill -1"
		silent execute "cs add GTAGS"
		echom "cscope add new GTAGS " . gtags_path
	endif
endfunction

"some action when enter a tab
function! TabEnterTag(nr)
    "echo "tab ". a:nr . " enter"
    call TabReloadCGtag()
endfunction

"some action when leave a tab
function! TabLeaveTag(nr)
    "echo "tab ". a:nr . " leaves"
    "nothing
endfunction

"don't care about pattern field for now
let g:TabTagTrigger = {'name':'TabTagTriger','pattern':"", 'enter_callback':"TabEnterTag", 'leave_callback':"TabLeaveTag" }

"call tab#TabShowTrigger()
call tab#TabAddTrigger(g:TabTagTrigger)

"when first open a tab, the tab enter trigger will not be called,the following code load tags automatically when open a file
autocmd BufEnter *.[ch] call TabReloadCGtag()
autocmd BufEnter *.cpp call TabReloadCGtag()
autocmd BufEnter *.java call TabReloadCGtag()
"}}}

"F2: toggle tagbar
noremap <silent> <F2> <ESC>:TagbarToggle<CR>
"F3: toggle NERDTree
noremap <silent> <F3> <ESC>:NERDTreeToggle<CR>
"F4: redraw screen
nnoremap <F4> <c-l>

"open file
nnoremap <F7> :call FileDir(1)<cr><c-l>
"open directory
nnoremap <F8> :call FileDir(0)<cr><c-l>

"{{{
"terminal settings
function! TerminalEdit(bufnum, arglist)
    echo "TerminalEdit"
    "execute "e " . a:arglist[0]
    execute "e ~/a.txt"
endfunction

"File filename
command! -nargs=0 T terminal ++curwin ++close bash

"some setting to easy terminal using
"F12 open terminal bash in rightbelow window
nnoremap <F12> :rightbelow terminal ++close bash<cr><c-l>
"ctrl+^ switch to previous buffer as in normal mode
tnoremap <c-^> <c-w>:bprevious<cr>
if has('nvim')
    "alt+b: open buffer explorer
    tnoremap <A+b> <c-w>:BufExplorerHorizontalSplit<cr>
    "alt+d: quit terminal window
    tnoremap <A+d> <c-w><c-c>
    "tnoremap <c-d> <c-w><c-c><cr>
    "alt+n: terminal go back to normal mode
    tnoremap <A+n> <c-w>N
    "alt+p: use to paste content to terminal, the newline will be omit,
    "because it will be change to enter key in the shell, cause unexpected
    "command start running right after paste text
    tnoremap <A+p>  <c-w>:call term_sendkeys('%', substitute(getreg(''),'\n','',""))<cr>
    "hi Terminal ctermbg=232 guibg=grey
else
    "alt+b: open buffer explorer
    tnoremap b <c-w>:BufExplorerHorizontalSplit<cr>
    "alt+d: quit terminal window
    tnoremap d <c-w><c-c>
    "tnoremap <c-d> <c-w><c-c><cr>
    "alt+n: terminal go back to normal mode
    tnoremap n <c-w>N
    "alt+p: use to paste content to terminal, the newline will be omit,
    "because it will be change to enter key in the shell, cause unexpected
    "command start running right after paste text
    tnoremap p  <c-w>:call term_sendkeys('%', substitute(getreg(''),'\n','',""))<cr>
    "hi Terminal ctermbg=232 guibg=grey
endif


"autocmd BufEnter * call Terminal_buffer_enter()
"autocmd BufLeave * call Terminal_buffer_leave()
au BufWinEnter * if &buftype == 'terminal' | setlocal bufhidden=hide | endif
"}}}

"File filename
command! -nargs=? -complete=file File call FileDir(1,<f-args>)
"Dir filename or directory
command! -nargs=? -complete=file Dir call FileDir(0,<f-args>)

"CommandT!!!  I love it
noremap <silent> <F9> <ESC>:CommandT<CR>

"map command line like shell
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
"cnoremap <Esc>b <S-Left>
"cnoremap <Esc>f <S-Right>
"cnoremap <Esc>d <S-right><Delete>

nnoremap ` '
nnoremap ' `

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell! spelllang=en_us<cr>

" spelling shortcuts using <leader>
" ]s next misspelled word
" [s previous misspelled word
" zg add to dict
" z= get suggestions
noremap <leader>sn ]s
noremap <leader>sp [s
"add to dict
noremap <leader>sa zg 
"get suggestions
noremap <leader>s= z=

"for neocomplcache, <alt-j>, not work!
"inoremap j <PageDown>
"inoremap k <PageUp>


"Q don't enter ex mode
nnoremap Q <nop>

"open BufExplorer window
noremap <silent> <Space>b :BufExplorerHorizontalSplit<CR>
noremap <silent> b :BufExplorerHorizontalSplit<CR>

"add /**/ at the end of line,and enter insert mode with cursor after the first *
nnoremap <leader>ca A /**/<ESC>hi
"add /**/ above current line,and enter insert mode with cursor after the first *
nnoremap <leader>cj O/**/<ESC>0f*a

"{{{
"CommandT, I love it...
"command-t use vim wildignore to determine which file should be excluded
set wildignore=*.o,*.obj,.git,.svn,*.pyc*,*.d
let g:CommandTTraverseSCM="pwd"
let g:CommandTMaxFiles=100000
let g:CommandTMaxDepth=9
let g:CommandTMaxCachedDirectories=30
let g:CommandTMaxHeight=0
let g:CommandTMinHeight=0
let g:CommandTTagIncludeFilenames=0
let g:CommandTCursorColor="red"
"let g:CommandTHighlightColor=120
"}}}


"{{{
"xxd binary file edit settings

"binary file, use xxd to hex editing
augroup Binary
au!
au BufReadPre  *.bin,*.exe let &bin=1
au BufReadPost *.bin,*.exe if &bin | %!xxd
au BufReadPost *.bin,*.exe set ft=xxd | endif
au BufWritePre *.bin,*.exe if &bin | %!xxd -r
au BufWritePre *.bin,*.exe endif
au BufWritePost *.bin,*.exe if &bin | %!xxd
au BufWritePost *.bin,*.exe set nomod | endif
augroup END
"}}}

"when _vimrc change,load _vimrc automaticly,don't need restart vim
autocmd! bufwritepost ~/.vimrc source ~/.vimrc
"autocmd! bufwritepost _vimrc source %
autocmd! bufwritepost *.vim source %

autocmd! VimEnter * silent !cs add GTAGS

" Git commits.
autocmd FileType gitcommit setlocal spell

syntax clear
syntax enable
syntax on

"{{{
"solarized settings

if !has("gui_running")
	set t_Co=256
	set background=dark
	let g:solarized_degrade = 1
	let g:solarized_termcolors=256
	"call SingleCompile#ChooseCompiler('cpp', 'clang')
endif

"let g:solarized_termtrans = 0
"let g:solarized_bold = 0
"let g:solarized_underline = 1
""""let g:solarized_contrast = "normal"| "high" or "low" 
"let g:solarized_contrast = "high"
"""""let g:solarized_visibility= "normal"| "high" or "low"
"let g:solarized_visibility= "high"
set background=dark
color solarized
"}}}

set noshowmode

"{{{
"session setting
"reset sessionoptions
set sessionoptions&
"set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,unix,slash,globals
"don't save options, and save globals
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,unix,slash,globals
let g:session_directory = "~/.vim/sessions/"
"don't save session when quit vim
let g:session_autosave = 'no'
"don't autoload session
let g:session_autoload = 'no'
"}}}

":hi Comment term=bold guifg=lightgray


"{{{
"tagbar settings

let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_autoshowtag = 1
let g:tagbar_expand = 1
let g:tagbar_singleclick = 1
let g:tagbar_iconchars = ['+', '-']
"}}}

"change some color setting
"hi Visual ctermfg=DarkYellow ctermbg=26 cterm=reverse
hi Visual ctermfg=23 cterm=reverse
"hi TabLine term=standout ctermbg=34 ctermfg=lightgreen guibg=Red guifg=White
"hi Search ctermbg=172 ctermfg=160
hi Search ctermbg=22 ctermfg=lightgreen

"modify highlight
"TODO better diff syntax highlight
hi DiffAdd ctermbg=red
hi DiffChange ctermbg=blue
hi DiffText ctermbg=lightgreen
hi DiffDelete ctermbg=green

"change completion color
hi Pmenu ctermbg=127
hi PmenuSel ctermbg=22
hi PmenuSbar ctermbg=blue
hi PmenuThumb cterm=reverse

if !exists("g:nerdtree_has_loaded")
	let g:nerdtree_has_loaded = 1
else
	finish
endif

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"{{{
"quick fix windows settings

autocmd BufWinEnter quickfix call QuickfixWinEnter_event()
"in quick fix windows, 'o' key act as 'enter' key
function! Quickfix_o_func()
	echo "Quickfix_O_func"
	let savepos = getpos('.')
	let nr = winnr()
	execute "normal \<cr>"
	execute nr . " wincmd w"
	call setpos('.', savepos)
endfunction

function! Quickfix_enter()
	nnoremap o :call Quickfix_o_func()<cr>
endfunction

function! Quickfix_leave_o()
	nunmap o
endfunction

function! Quickfix_leave()
	nunmap o
endfunction

function! QuickfixWinEnter_event()
	"echo "quickfix window enter"
	au! * <buffer>
    "map buffer specify keys
	au BufEnter <buffer> call Quickfix_enter()
	au BufLeave <buffer> call Quickfix_leave()

	call Quickfix_enter()
	"echo "quickfix bufnr " g:Quickfix_bufnr
	"call WaitKey()
endfunction
"}}}

"{{{
"quick fix and diff windows settings
"quick fix: such as tags, grep, make program output

"quick fix or diff mode jump next
nnoremap <F5> :call Quickfix_Diff_Next_Item()<cr>
"quick fix or diff mode jump prev
nnoremap <F6> :call Quickfix_Diff_Prev_Item()<cr>
"noremap <silent> <F2> :call Tagbar_Nerdtree_Window()<CR>

"F5,F6 use for diff mode or quickfix mode jump
function! Quickfix_Diff_Next_Item()
	if &diff
		execute "normal ]c"
		return
	endif

	let qf=getqflist()
	if len(qf) > 0
		try
			execute ":silent cnext"
			execute "normal zz"
			return
		catch
		endtry
	endif
endfunc

"F5,F6 use for diff mode or quickfix mode jump
function! Quickfix_Diff_Prev_Item()
	if &diff
		execute "normal [c"
		return
	endif

	let qf=getqflist()
	if len(qf) > 0
		try
			execute "silent cprev"
			execute "normal zz"
			return
		catch
		endtry
	endif
endfunc
"}}}


"{{{
"grep settings

"grep file filter settings
set grepprg=grep\ -n\ -H\ -R\ -E\ --exclude-dir=.git\ --exclude-dir=.svn\ --include=*.[cCsShH]\ --include=*.txt\ --include=*.cpp\ --include=*.py\ --include=*.pl\ --include=*.java\ --include=*.lua\ --include=*.vim\ --include=*.mk\ --include=*.ld\ --include=*.sh\ --include=*.bat\ --include=[Mm]akefile\ --include=*.mk\ --include=.vimrc\ --include=*.xml\ --include=*.dts\ --include=*.dtsi\ --include=*config\ --include=*.rc\ --include=*.hpp\ --include=*.cc\ --include=*.in\ --include=*.am\ --include=*.asm\ --include=*.map\ --include=*.php
"set grepprg=grep\ -nH
set grepformat=%f:%l:%m

"command 'G': call grep program
command! -nargs=+ -complete=command G call Grep(<q-args>)

"command 'Gr': call grep program without file filters
command! -nargs=+ -complete=command Gr call GrepRaw(<q-args>)

"F10: grep the word under cursor in current directory
nnoremap <F10> :call GrepCursorWord()<cr>

"command: Grep re path
function! Grep(cmd)
	execute 'cclose'
	call setqflist([])
	execute "silent! grep -r " . a:cmd . " ."
	execute "normal \<F4>"
	let qflist = getqflist()
	if len(qflist) >= 1
		execute 'rightbelow cw'
	endif
endfunction

"grep the word under the cursor
function! GrepCursorWord()
	let word = expand("<cword>")
	echo word
	"call getchar()
	"execute ":Grep " . word . " ."
	"let cmd = "" . word
	call Grep(word)
	"TODO highlight the word, not work!
	execute "normal /" . word . "\<cr>"
endfunc

function! GrepRaw(cmd)
	call setqflist([])
	execute 'cclose'
	let save_grepprg=&g:grepprg
	set grepprg=grep\ -n\ -R\ -H\ --exclude-dir=.git\ --exclude-dir=.svn
	execute "silent! grep " a:cmd
    "restore grep file filter settings
	let &g:grepprg=save_grepprg
	execute "normal \<F4>"
	let qflist = getqflist()
	if len(qflist) > 1
		execute 'rightbelow cw'
	endif
endfunction
"}}}

"{{{
"turn abcd23,023023 to "\xab\xcd\x23","\x02\x30\x23"
command! -range TurnHexString call TurnChar('"','"',"\\x","",2)
"turn 534334 to 0x53,0x43,0x34, 
command! -range TurnHexNumber call TurnChar('','',"0x",",",2)

function! TurnChar(word_prefix, word_postfix, char_prefix,char_postfix,char_step)
	let [lnum1, col1] = [line("'<"),col("'<")]
	let [lnum2, col2] = [line("'>"),col("'>")]

	"echo "a:startNum:" . a:startNum
	let lines = getline(lnum1, lnum2)
	let newlines = []

	let searchLength = col2
	"blockwise mode, adjust searchLength to the max line length
	if visualmode() == "V"
		for line in lines
			if strlen(line) > searchLength
				let searchLength = strlen(line)
			endif
		endfor
	endif

	"echo "===================="
	"find number position,change it
	let i = 0
	for line in lines

		let startByte = col1 - 1
		"echo "searchLength" . searchLength
		let line_new = strpart(line,0,startByte)
		while 9 
			let matchByte = match(line,"[0-9a-fA-F]\\+",startByte)
			"echo "matchByte:" . matchByte
			if matchByte != -1

				"echo "matchByte:" . matchByte
				let matchstr = matchstr(line,"[0-9a-fA-F]\\+", matchByte)
				let matchstr_len = len(matchstr)
				"echo "startByte:" . startByte
				"echo "matchstr:" . matchstr
				"echo "matchstr_len:" . matchstr_len

				if (matchByte + matchstr_len) > searchLength
					"echo "break"
					let line_new .= strpart(line,startByte)
					break
				endif

				"XXX below should use regular expression
				let line_new .= strpart(line,startByte,matchByte-startByte)

				let line_new .= a:word_prefix
				let char_visit_len = 0
				let char_start = 0
				let char_change = ""
				while char_visit_len < matchstr_len
					let char_split = strpart(matchstr,char_start,a:char_step)
					let char_change .= a:char_prefix . char_split . a:char_postfix
					let char_visit_len = char_visit_len + a:char_step
					let char_start = char_start + a:char_step
				endwhile
				let line_new .= char_change
				let line_new .= a:word_postfix

				"\x34\e\x34\e,\xad\e\xcd\e\x00\e
				"\x43\e,\xdf\e\xd0\e
				""\x34\e\x34\e","\xad\e\xcd\e\x00\e"
				""\x43\e","\xdf\e\xd0\e"
				"3434,adcd00
				"43,dfd0

				""echo a:startNum
				"if type(a:startNum) == type(0)
					""sort the number start by startNum
					""echo a:startNum + i*a:step
					"let line_new .= "" . (a:startNum + i*a:step)
				"else  " '.'
					""new number = old number + step
					"let line_new .= "" . eval(matchstr) + a:step
				"endif
				""echo "line_new" . line_new

				let startByte = matchByte + matchstr_len
				let i += 1
			else
				let line_new .= strpart(line,startByte)
				break
			endif
		endwhile
		call add(newlines,line_new)
	endfor

	let startLine = lnum1
	"set new line
	for line in newlines
		call setline(startLine, line)
		let startLine += 1
	endfor
endfunc
"}}}

"{{{
"K_func: file try to find tags, if fails, fall back to normal K function in
"vim, that's UNIX man or vim help documents
"map K to man or tag jump
nnoremap K :call K_func()<CR>

function! K_func()
	let v:errmsg = ""

	let word = expand("<cword>")
	"TODO why, according to ":help silent", v:errmsg should still be set when "use silent!"
	"execute ":silent! cs find g " word
	call setqflist([])
	execute "cclose"
	execute ":cs find g " word
	if v:errmsg == ""
		let qflist = getqflist()
		if len(qflist) > 1
			execute 'rightbelow cw'
		endif
		return
	endif

	execute "tag " word
	if v:errmsg == ""
		return
	endif

	if v:errmsg != ""
		"first unmap K
		unmap K
		execute "silent normal K"
		redraw
		"restore K maping
		nnoremap K :call K_func()<CR>
	endif

	execute "normal \<F4>"
endfunc
"}}}

"
func! GetFileDir(filename)
	if a:filename == "%" "special,'%' means current file
		let current_file = getreg('%')
	else 
		let current_file = a:filename
	endif

	if isdirectory(filename)
		return current_file
	endif

	let last_slash = strridx(current_file, "/")
	if last_slash != -1
		let current_dir = strpart(current_file, 0, last_slash+1)
	else
		let current_dir = "./"
	endif
	"echo current_dir
	return current_dir
endfunc

function! FileDir(isfile,...)
	let usage = "Usage: FileDir or FileDir filename"

	if a:0 > 0
		let current_file = a:1
	elseif a:0 == 0
		let current_file = getreg('%')
	else
		echo usage
		return
	endif

	let path = current_file
	if a:isfile == 0
		let path = GetFileDir(current_file)
	endif
	"echom "dir is "
	"echom dir

	"if s:hascygwin == 1
	if has("win32unix") && isdir == 1 "cygwin open directory
		"exe "silent !start explorer ".shellescape(path,1)
		exe "silent !cmd /c start cygstart ".path
	elseif has("win32unix")  "cygwin open file, use windows file blowers
		exe "silent !start explorer ".path
	elseif has("unix") && executable("gnome-open")
		exe "silent !gnome-open ".path
		let ret= v:shell_error
	elseif has("unix") && executable("kde-open")
		exe "silent !kde-open ".path
		let ret= v:shell_error
	elseif has("unix") && executable("open")
		exe "silent !open ".path
		let ret= v:shell_error
	elseif has("win32") || has("win64")
		"exe "silent !start explorer ".shellescape(path,1)
		exe "silent !start explorer ".path
	end

	redraw!
	redraws!
endfunction

