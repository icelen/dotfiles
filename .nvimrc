" vim:fdm=marker
" basic {{{
set encoding=utf-8
set t_Co=256
set t_ut=
set shortmess=a
" auto load file in case of change outside of Vim
" set autoread
syntax enable
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
set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
" set wrap                        "wrap:  wraps lines by default
" Toggle line wrapping in normal mode:
" nmap <silent> <C-P> :set nowrap!<cr>:set nowrap?<cr>

set showmatch                   "sm:    flashes matching brackets or parentheses
set nobackup                    "bk:    does not write a persistent backup file of an edited file
set writebackup                 "wb:    does keep a backup file while editing a file
set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)
set colorcolumn=80
" set ruler
set showcmd
set t_ut=
set relativenumber
set number
set tabstop=2
set modeline
set shiftwidth=2
set smarttab
set number
set expandtab
set softtabstop=2
set textwidth=120
" set autoindent
set hidden

" }}}

" Vim-Plug {{{
"
" Load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/matchit'

Plug 'maxbrunsfeld/vim-yankstack'
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

"vim-airline
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled    = 1
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#fnamemod   = ':t'
let g:airline#extensions#ctrlspace#enabled  = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10
" set laststatus=2
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme = 'solarized dark'
" let g:airline_theme = 'bubblegum'
" Plug 'paranoida/vim-airlineish'
" let g:airline_theme = 'airlineish'
" let g:airline_theme = 'molokai'

autocmd InsertEnter,InsertLeave * set cul!
Plug 'tomtom/tcomment_vim'
Plug 'myusuf3/numbers.vim'
" Plug 'neomake/neomake'

Plug 'justinmk/vim-sneak'
let g:sneak#streak = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'

" Rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
      \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \	'operators': '_,_',
      \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \	'separately': {
      \		'*': {},
      \		'vim': {
      \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \		},
      \		'html': {
      \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \		},
      \		'css': 0,
      \	}
      \}

Plug 'szw/vim-ctrlspace'
inoremap <C-Space> <ESC>:CtrlSpace<cr>
nnoremap <C-Space> :CtrlSpace<cr>
nnoremap <silent><leader>b :CtrlSpace b<CR>
let g:CtrlSpaceStatuslineFunction       = 'airline#extensions#ctrlspace#statusline()'
let g:CtrlSpaceUseTabline               = 1
let g:airline_exclude_preview           = 1
let g:CtrlSpaceUseUnicode               = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch    = 1
let g:CtrlSpaceSaveWorkspaceOnExit      = 1
if executable('ag')
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
let g:CtrlSpaceSearchTiming = 400

Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup=1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

" scala
Plug 'derekwyatt/vim-scala'
Plug 'solarnz/thrift.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/mru.vim'
Plug 'mhinz/vim-startify'
let g:startify_bookmarks = ['~/.config/nvim/init.vim']
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_list_order = [
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   LRU:'],
            \ 'files',
            \ ['   LRU within this dir:'],
            \ 'dir',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ]

Plug 'mustache/vim-mustache-handlebars'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
let g:Gitv_OpenHorizontal = 1
Plug 'jreybert/vimagit'
Plug 'kshenoy/vim-signature'
let g:SignatureMarkerTextHLDynamic=1
let g:SignatureMarkTextHLDynamic=1
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
Plug 'icelen/neovim-ranger'
map <leader>r :Explore %:p:h<CR>
Plug 'ervandew/supertab'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" Plug 'eraserhd/vim-ios'
Plug 'SirVer/ultisnips'
" UltiSnips
" The below key bindings are compatible with YouCompletMe integration
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
"
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-slash'
noremap <plug>(slash-after) zz

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'edkolev/tmuxline.vim'
let g:airline#extensions#tmuxline#enabled = 0
Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
Plug 'FooSoft/vim-argwrap'
Plug 'henrik/vim-open-url'
nnoremap <silent> <leader><leader>a :ArgWrap<CR>
Plug 'chrisbra/vim-diff-enhanced'
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

Plug 'ryanoasis/vim-devicons'

Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'

" rst
" Plug 'vim-scripts/rest.vim'

Plug 'wellle/targets.vim'

" Pandoc
Plug 'vim-pandoc/vim-pandoc', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'pandoc', 'markdown' ] }
au BufNewFile,BufRead *.md set filetype=pandoc
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#spell#enabled = 1
let g:pandoc#spell#default_langs = ['en_us']

Plug 'w0rp/ale'

call plug#end()
"}}}

" More settings {{{
set hlsearch
set clipboard=unnamed
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" colors Monokai
" let g:monokai_original = 1
" let g:monokai_termcolors=256
" let g:monokai_termtrans=1
"

" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" colorscheme solarized
let g:gruvbox_italic=1
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_termcolors=16

let g:python_host_prog='/opt/twitter/bin/python2'
let g:python3_host_prog='/opt/twitter/bin/python3'
" file tpye and syntax
au BufNewFile,BufRead *.py set filetype=python

" spells
set spell spelllang=en_us

" tags
set tagstack
set tags=tags;/

" VimR
if has('gui_vimr')
    set termguicolors
    set title
endif

" Better refresh
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv
" cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
" auto remove tailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" diff
set diffopt=filler,vertical,iwhite

" }}}

" Keys {{{
" set macmeta
let g:mapleader      = "\\"
let g:maplocalleader = "\\"

map <SPACE> <leader>

nmap <F8> :TagbarToggle<CR>

nnoremap j zzj
nnoremap k zzk
" Display the number of matches for the last search
nmap <leader># :%s:<C-R>/::gn<cr>

nmap L $
nmap H ^

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" No ex-mode
nnoremap Q <Nop>
nnoremap q <Nop>

set pastetoggle=<F9>            "pt:    useful so auto-indenting doesn't mess up code when pasting
"screen setting
inoremap jj <ESC>
" inoremap <C-s> <ESC>:w<cr>a
" nnoremap <C-s> :w<cr>

" disable arrowkeys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
nnoremap K 5kzz
nnoremap J 5jzz

" paste without yank
vnoremap <leader>p "_0p
vnoremap <leader>P "_0P
" nnoremap <M-h> :bnext<CR>
" nnoremap <M-l> :bprev<CR>
"
" }}}

" Functions {{{
"
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

command! -nargs=1 Silent
\ | execute ':silent '.<q-args>
\ | execute ':redraw!'

function! BufGet()
    return map(getline(1, '$'), "printf('%5d  %s', v:key + 1, v:val)")
endfunction

function! LineOpen(e)
    execute 'normal! '. matchstr(a:e, '[0-9]\+'). 'G'
endfunction

" IntelliJ
function! OpenInIntelliJ()
    execute "!/Applications/IntelliJ\\ IDEA\\ 14\\ CE.app/Contents/MacOS/idea /Users/icelen/IdeaProjects/testJavaWithIntelliJ/ --line " . line('.') . " " . expand('%:p') . "&>/dev/null"
endfunction

nnoremap <leader>i :Silent call OpenInIntelliJ()<CR>

" tempfunction for geting appID
function! GetAppIDs()
    execute 'g!/<td>\d\+<\/td>/d'
    execute '%s/^\s\+<td>\(\d\+\)<\/td>/\1/g'
    execute '%y+'
endfunction

" fzf related

function! s:get_git_root()
  if exists('*fugitive#repo')
    try
      return fugitive#repo().tree()
    catch
    endtry
  endif
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! s:find_project_root()
  let projects=['/Users/lcen/workspace/source/macaw-login', '/Users/lcen/workspace/source/passbird', '/Users/lcen/workspace/source/bouncer', '/Users/lcen/workspace/source/macaw-swift', '/Users/lcen/workspace/source/intern-harness/']
  let gitroot=s:get_git_root()
  call add(projects, gitroot)
  let filepath=expand('%:p:h')
  for path in projects
      if filepath=~'^' . path
          return path
      endif
  endfor
  return gitroot
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! ProjectFiles execute 'Files' getcwd()
command! GitRootFiles execute 'Files' s:get_git_root()

nnoremap <silent> <leader>f :ProjectFiles<CR>
nnoremap <silent> <leader>F :GitRootFiles<CR>
" nnoremap <silent> <leader>f :call fzf#run({
"             \   'dir'     : s:get_git_root(),
"             \   'sink'    : 'e',
"             \   'options' : '-m',
"             \ })<CR>
nnoremap <silent> <leader>m :call fzf#run({
            \'source'  : v:oldfiles,
            \'sink'    : 'e ',
            \'options' : '-m',
            \})<CR>

function! s:escape(path)
  return substitute(a:path, ' ', '\\ ', 'g')
endfunction

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)
nnoremap <silent> <leader>s :Ag!<CR>

function! AgHandler(line)
  let parts = split(a:line, ':')
  let [fn, lno] = parts[0 : 1]
  execute 'e '. s:escape(fn)
  execute lno
  normal! zz
endfunction

command! -nargs=+ Fag call fzf#run({
            \ 'dir':         s:get_git_root(),
            \ 'source':      'ag "<args>"',
            \ 'sink':        function('AgHandler'),
            \ 'options':     '+m',
            \ 'tmux_height': '60%'
\ })

" Search for selected text, forwards or backwards.
" vnoremap <silent> * :<C-U>
"   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"   \gvy/<C-R><C-R>=substitute(
"   \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"   \gV:call setreg('"', old_reg, old_regtype)<CR>
" vnoremap <silent> # :<C-U>
"   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"   \gvy?<C-R><C-R>=substitute(
"   \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"   \gV:call setreg('"', old_reg, old_regtype)<CR>

command! -nargs=0 MD
\ | execute ":silent !open -a Marked\\ 2 '%:p'"
\ | execute ':redraw!'

" Format JSON string
com! FormatJSON !python -m json.tool

" Twitter indentation
func! SetTwitterOptions()
    set softtabstop=2
    set shiftwidth=2
    set tabstop=2
    set expandtab
    set modeline
    set colorcolumn=100
endfunc

" }}}
