set encoding=utf-8
set t_Co=256
set t_ut=
set shortmess=a
" auto load file in case of change outside of Vim
set autoread
" colors Monokai
" let g:monokai_original = 1
" let g:monokai_termcolors=256
" let g:monokai_termtrans=1
set clipboard=unnamed
syntax enable
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set background=dark

" if &term =~ '^screen'
"     execute "set t_kP=\e[5;*~"
"     execute "set t_kN=\e[6;*~"
"     execute "set <xUp>=\e[1;*A"
"     execute "set <xDown>=\e[1;*B"
"     execute "set <xRight>=\e[1;*C"
"     execute "set <xLeft>=\e[1;*D"
" endif
"
"
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
set hidden
set macmeta
let mapleader="\\"
let maplocalleader="\\"

" for neovim
if has("unix")
  let s:uname = system("uname")
  let g:python_host_prog='/usr/bin/python'
  if s:uname == "Darwin\n"
    let g:python_host_prog='/usr/local/bin/python'
  endif
endif

" Display the number of matches for the last search
nmap <leader># :%s:<C-R>/::gn<cr>

nmap L <End>
nmap H ^
" search visually selected
vnoremap // y/<C-R>"<CR>
" No ex-mode
nnoremap Q <Nop>
nnoremap q <Nop>

set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
" set wrap                        "wrap:  wraps lines by default
" Toggle line wrapping in normal mode:
" nmap <silent> <C-P> :set nowrap!<cr>:set nowrap?<cr>

set showmatch                   "sm:    flashes matching brackets or parentheses
set nobackup                    "bk:    does not write a persistent backup file of an edited file
set writebackup                 "wb:    does keep a backup file while editing a file

set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)
set pastetoggle=<F9>            "pt:    useful so auto-indenting doesn't mess up code when pasting
set colorcolumn=80

set backspace=indent,eol,start

set ruler
set showcmd
"screen setting
inoremap jj <ESC>
" vnoremap jj <ESC>
" inoremap <C-s> <ESC>:w<cr>a
" nnoremap <C-s> :w<cr>

" disable arrowkeys
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>

nnoremap K gt
nnoremap J gT

syntax on

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
filetype indent on
filetype plugin on
set nocompatible              " be iMproved
set incsearch                   "is:    automatically begins searching as you type
" set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set hlsearch
filetype off                  " required!

" set the runtime path to include Vundle and initialize
" fzf
set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'msanders/snipmate.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/matchit'
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

" Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/unite.vim'

"vim-airline
Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
Bundle 'paranoida/vim-airlineish'
let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'airlineish'
" let g:airline_theme = 'molokai'

autocmd InsertEnter,InsertLeave * set cul!
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'

Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'davidhalter/jedi-vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/vimshell.vim'

" Pandoc 
Plugin 'vim-pandoc/vim-pandoc'
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#spell#enabled = 1
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc-after'
let g:pandoc#after#modules#enabled = ["supertab"]

Plugin 'justinmk/vim-sneak'
let g:sneak#streak = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'repmo.vim'
Plugin 'terryma/vim-multiple-cursors'
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
inoremap <C-Space> <ESC>:CtrlSpace<cr>
nnoremap <C-Space> :CtrlSpace<cr>
let g:ctrlspace_use_tabline = 1
let g:airline_exclude_preview = 1
" set showtabline=0

Plugin 'LaTeX-Box-Team/LaTeX-Box'
" let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1
" let g:LatexBox_latexmk_options="-f -outdir='Output'"
let g:LatexBox_latexmk_options="-f -outdir='Output -pdflatex='pdflatex -synctex=1 \%O \%S'"
let g:LatexBox_build_dir="Output"
let b:build_dir="Output"
" map <silent> <Leader>ls :silent
"             \ !/Applications/Skim.app/Contents/SharedSupport/displayline
"             \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
"             \ "%:p" <CR>
"             
Plugin 'derekwyatt/vim-scala'
Plugin 'solarnz/thrift.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'neilagabriel/vim-geeknote'
Plugin 'danro/rename.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'vim-scripts/mru.vim'
Plugin 'mhinz/vim-startify'
let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_custom_footer =
            \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

let g:startify_list_order = [
            \ ['   LRU:'],
            \ 'files',
            \ ['   LRU within this dir:'],
            \ 'dir',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ]
let g:startify_custom_header =
            \ map(split(system('cowsay Hi Icelen!'), '\n'), '"   ". v:val') + ['']

Plugin 'airblade/vim-gitgutter'
Plugin 'kshenoy/vim-signature'
let g:SignatureMarkerTextHLDynamic=1
let g:SignatureMarkTextHLDynamic=1
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ranger
fun! RangerChooser(type)
    exec "silent !ranger --choosefiles=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        if a:type == 1
            exec 'Ewindows ' . system('cat /tmp/chosenfile|tr "\n" " "')
        elseif a:type == 2
            exec 'Evwindows ' . system('cat /tmp/chosenfile|tr "\n" " "')
        elseif a:type == 3
            exec 'edit ' . system('cat /tmp/chosenfile|tr "\n" " "')
        else
            exec 'Etabs ' . system('cat /tmp/chosenfile|tr "\n" " "')
        endif
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
command! -nargs=1 Silent
\ | execute ':silent '.<q-args>
\ | execute ':redraw!'
map <leader><leader>r :call RangerChooser(4)<CR>
" map <leader>rv :call RangerChooser(2)<CR>
" map <leader>rs :call RangerChooser(1)<CR>
" map <leader>rb :call RangerChooser(3)<CR>
" Enable add multiple files to edit
command! -complete=file -nargs=+ Etabs call s:ETW('tabnew', <f-args>)
" command! -complete=file -nargs=+ Ewindows call s:ETW('new', <f-args>)
" command! -complete=file -nargs=+ Evwindows call s:ETW('vnew', <f-args>)
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

function! BufGet()
    return map(getline(1, '$'), "printf('%5d  %s', v:key + 1, v:val)")
endfunction

function! LineOpen(e)
    execute 'normal! '. matchstr(a:e, '[0-9]\+'). 'G'
endfunction

function! Gitroot()
    return system('git root 2>/dev/null')
endfunction

function! OpenInIntelliJ()
    execute "!/Applications/IntelliJ\\ IDEA\\ 14.app/Contents/MacOS/idea ~/workspace/source/science/.pants.d/idea/idea/TwitterIdeaGen_idea/project --line " . line('.') . " " . expand('%:p') . "&>/dev/null"

endfunction

function! GetAppIDs()
    execute 'g!/<td>\d\+<\/td>/d'
    execute '%s/^\s\+<td>\(\d\+\)<\/td>/\1/g'
    execute '%y+'
endfunction

nnoremap <leader><leader>i :Silent call OpenInIntelliJ()<CR>
" nnoremap <silent> <C-f> :call fzf#run({
"             \   'source':      BufGet(),
"             \   'sink':        function('LineOpen'),
"             \   'options':     '+m',
"             \   'tmux_height': '40%'
"             \ })<CR>
nnoremap <silent> <leader><leader>f :call fzf#run({
            \   'dir':         Gitroot(),
            \   'sink':        'tabe',
            \   'options':     '-m',
            \ })<CR>
" nnoremap <silent> <leader>f :call FZFGit()<CR>
nnoremap <silent> <leader><leader>m :call fzf#run({
            \'source': v:oldfiles,
            \'sink' : 'e ',
            \'options' : '-m',
            \})<CR>
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" command! MD execute "silent !open -a Marked\\ 2 %"
command! -nargs=0 MD
\ | execute ":silent !open -a Marked\\ 2 '%:p'"
\ | execute ':redraw!'

