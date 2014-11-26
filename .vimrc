set encoding=utf-8
set t_Co=256
set t_ut=
" colors Monokai
" let g:monokai_original = 1
" let g:monokai_termcolors=256
" let g:monokai_termtrans=1
" colors google
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:rehash256 = 1

" if &term =~ '^screen'
"     execute "set t_kP=\e[5;*~"
"     execute "set t_kN=\e[6;*~"
"     execute "set <xUp>=\e[1;*A"
"     execute "set <xDown>=\e[1;*B"
"     execute "set <xRight>=\e[1;*C"
"     execute "set <xLeft>=\e[1;*D"
" endif
set t_ut=
set relativenumber 
set number  
set tabstop=8

set modeline
set shiftwidth=4
set smartindent
set number
set expandtab
set softtabstop=4
set textwidth=120
set autoindent
" No ex-mode
nnoremap Q <nop> 

" Display the number of matches for the last search
nmap <leader># :%s:<C-R>/::gn<cr>

nmap L <End>
nmap H <Home>
" Restore case-sensitivity for jumping to tags (set ic disables it)
" map <silent> <C-]> :set noic<cr>g<C-]><silent>:set ic<cr>
map ^[[A <up>
map ^[[B <down>
map ^[[C <right>
map ^[[D <left>
" }}} " Line Wrap {{{
"
" deal with <C-S>

set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
set wrap                        "wrap:  wraps lines by default
" Toggle line wrapping in normal mode:
nmap <silent> <C-P> :set nowrap!<cr>:set nowrap?<cr>

set showmatch                   "sm:    flashes matching brackets or parentheses
set nobackup                    "bk:    does not write a persistent backup file of an edited file
set writebackup                 "wb:    does keep a backup file while editing a file

set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)
set pastetoggle=<F9>            "pt:    useful so auto-indenting doesn't mess up code when pasting
set colorcolumn=80

" Change directory to the path of the current file
map <leader>cd :cd %:p:h<cr>

syntax on

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
filetype indent on
filetype plugin on
set nocompatible              " be iMproved
set incsearch                   "is:    automatically begins searching as you type
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set hlsearch
filetype off                  " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'msanders/snipmate.vim'
" Plugin 'fo60213/matlab-snippets'
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/matchit'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
" set sessionoptions-=help
" set sessionoptions-=options
" let g:session_autoload=yes
" let g:session_autosave=1
" let g:session_autosave_periodic=5
" let g:session_verbose_messages=0
" let g:session_default_to_last=1
" let g:session_command_aliases=1

Plugin 'L9'
Plugin 'LargeFile'
Plugin 'godlygeek/tabular'
Plugin 'maxbrunsfeld/vim-yankstack'
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
Plugin 'AutoClose'
" Bundle 'YankRing.vim'
" nnoremap <silent> <C-Y>:YRShow<CR>
" let g:yankring_replace_n_pkey ='' 
" let g:yankring_replace_n_nkey =''
"
" Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
" Gif config
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)


" Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/unite.vim'

"
"vim-airline
Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_exclude_preview = 1
set laststatus=2
Bundle 'paranoida/vim-airlineish'
let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'airlineish'
" let g:airline_theme = 'molokai'

set backspace=indent,eol,start

set ruler
set showcmd
"screen setting
inoremap jj <ESC>
" vnoremap jj <ESC>
inoremap <C-s> <ESC>:w<cr>a
nnoremap <C-s> :w<cr>
" inoremap <C-k> <ESC>:shell<cr>
" nnoremap <C-k> :shell<cr>

" disable arrowkeys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap K gt
nnoremap J gT

autocmd InsertEnter,InsertLeave * set cul!
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
" nmap <leader>bb :CtrlPBuffer<cr>
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeDirArrows=0
map <C-n> :NERDTreeTabsToggle<CR>
" map <C-n> :NERDTreeToggle<CR>
" Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'jlanzarotta/bufexplorer'
let g:bufExplorerFindActive=1        " Go to active window.
nmap  <leader>be <Nop>
nmap  <leader>bs <Nop>
" nmap  <leader>bv <Nop>
noremap <silent> <leader>bb :BufExplorerHorizontalSplit<CR>

Plugin 'tomtom/tcomment_vim'
Plugin 'myusuf3/numbers.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/vimshell.vim'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
" Plugin 'tpope/vim-dispatch'
" Plugin 'tpope/vim-unimpaired'
Plugin 'repmo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chrisbra/changesPlugin'
Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plugin 'szw/vim-ctrlspace'
" inoremap <leader>s <ESC>:CtrlSpace l<cr>
" nnoremap <leader>s :CtrlSpace l<cr>
let g:ctrlspace_use_tabline = 1

set hidden
" Plugin 'kana/vim-textobj-entire'
" Plugin 'edkolev/tmuxline.vim'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

fun! RangerChooser()
    exec "silent !ranger --choosefiles=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'Etabs ' . system('cat /tmp/chosenfile|tr "\n" " "')
        " call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map <leader>r :call RangerChooser()<CR>
" Enable add multiple files to edit
command! -complete=file -nargs=+ Etabs call s:ETW('tabnew', <f-args>)
command! -complete=file -nargs=+ Ewindows call s:ETW('new', <f-args>)
command! -complete=file -nargs=+ Evwindows call s:ETW('vnew', <f-args>)
function! s:ETW(what, ...)
    for f1 in a:000
        let files = glob(f1)
        if files == ''
            execute a:what . ' ' . escape(f1, '\ "''"')
        else
            for f2 in split(files, "\n")
                execute a:what . ' ' . escape(f2, '\ "''"')
            endfor
        endif
    endfor
endfunction
