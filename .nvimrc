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
" et backspace=indent,eol,start
" set ruler
set showcmd
set t_ut=
set relativenumber
set number
set tabstop=4
set modeline
set shiftwidth=4
set smartindent
set number
set expandtab
set softtabstop=4
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
" Plug 'sjl/gundo.vim'
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/matchit'

Plug 'L9'
Plug 'LargeFile'
" Plug 'Terminus'
" Plug 'godlygeek/tabular'
Plug 'maxbrunsfeld/vim-yankstack'
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
Plug 'AutoClose'

Plug 'Shougo/unite.vim'

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
Plug 'neomake/neomake'

" Pandoc
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'vim-pandoc/vim-pandoc' , { 'for': 'markdown' }
let g:pandoc#spell#enabled = 1
let g:pandoc#spell#default_langs = ["en_us"]
" let g:pandoc#after#modules#enabled = ["supertab"]

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
Plug 'repmo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
\ ['brown'       , 'RoyalBlue3'],
\ ['Darkblue'    , 'SeaGreen3'],
\ ['darkgray'    , 'DarkOrchid3'],
\ ['darkgreen'   , 'firebrick3'],
\ ['darkcyan'    , 'RoyalBlue3'],
\ ['darkred'     , 'SeaGreen3'],
\ ['darkmagenta' , 'DarkOrchid3'],
\ ['brown'       , 'firebrick3'],
\ ['gray'        , 'RoyalBlue3'],
\ ['black'       , 'SeaGreen3'],
\ ['darkmagenta' , 'DarkOrchid3'],
\ ['Darkblue'    , 'firebrick3'],
\ ['darkgreen'   , 'RoyalBlue3'],
\ ['darkcyan'    , 'SeaGreen3'],
\ ['darkred'     , 'DarkOrchid3'],
\ ['red'         , 'firebrick3'],
\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'szw/vim-ctrlspace'
inoremap <C-Space> <ESC>:CtrlSpace<cr>
nnoremap <C-Space> :CtrlSpace<cr>
nnoremap <silent><C-p> :CtrlSpace O<CR>
let g:CtrlSpaceStatuslineFunction       = "airline#extensions#ctrlspace#statusline()"
let g:CtrlSpaceUseTabline               = 1
let g:airline_exclude_preview           = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceUseUnicode               = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch    = 1
let g:CtrlSpaceSaveWorkspaceOnExit      = 1
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
let g:CtrlSpaceSearchTiming = 200
" set showtabline=0

Plug 'derekwyatt/vim-scala'
Plug 'solarnz/thrift.vim'
" Plugin 'christoomey/vim-tmux-navigator'
Plug 'neilagabriel/vim-geeknote'
let g:GeeknoteFormat="markdown"
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/mru.vim'
Plug 'mhinz/vim-startify'
let g:startify_bookmarks = ['~/.config/nvim/init.vim']
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
" let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
" let g:startify_custom_footer =
            " \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

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
" let g:startify_custom_header =
"             \ map(split(system('cowsay Hi Icelen! NEOVIM Here!'), '\n'), '"   ". v:val') + ['']

Plug 'mustache/vim-mustache-handlebars'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
let g:Gitv_OpenHorizontal = 1
Plug 'jreybert/vimagit'
Plug 'kshenoy/vim-signature'
let g:SignatureMarkerTextHLDynamic=1
let g:SignatureMarkTextHLDynamic=1
" Plug 'Numkil/ag.nvim'
" let g:ag_working_path_mode="r"
" let g:ag_highlight=1
Plug 'Chun-Yang/vim-action-ag'
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
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"
" " better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" let g:deoplete#enable_at_startup = 1
" Plug 'vhakulinen/neovim-intellij-complete-deoplete'
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'edkolev/tmuxline.vim'
let g:airline#extensions#tmuxline#enabled = 0
Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
Plug 'chrisbra/vim-diff-enhanced'
Plug 'FooSoft/vim-argwrap'
nnoremap <silent> <leader><leader>a :ArgWrap<CR>
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

Plug 'ryanoasis/vim-devicons'
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

let g:python_host_prog='/opt/twitter/bin/python'
let g:python3_host_prog='/opt/twitter/bin/python3'
" file tpye and syntax
au BufNewFile,BufRead *.md set filetype=pandoc
au BufNewFile,BufRead *.markdown set filetype=pandoc

" spells
set spell spelllang=en_us

" tags
set tags=tags;/

" VimR
if has("gui_vimr")
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

" diff
set diffopt=filler,vertical,iwhite

" }}}

" Keys {{{
" set macmeta
let mapleader      = "\\"
let maplocalleader = "\\"

nnoremap j zzj
nnoremap k zzk
" Display the number of matches for the last search
nmap <leader># :%s:<C-R>/::gn<cr>

nmap L <End>
nmap H <HOME>

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

" ================ Ranger =======================
" ranger
" command! -complete=file -nargs=+ Etabs call s:ETW('tabnew', <f-args>)
" command! -complete=file -nargs=+ Ebufs call s:ETW('e', <f-args>)
" command! -complete=file -nargs=+ Ewindows call s:ETW('new', <f-args>)
" command! -complete=file -nargs=+ Evwindows call s:ETW('vnew', <f-args>)
"
" function! s:ETW(what, ...)
"     for f1 in a:000
"         let files = glob(f1)
"         if files == ''
"             execute a:what . ' ' . escape(f1, '\ "''"')
"         else
"             for f2 in split(files, "\n")
"                 execute a:what . ' ' . escape(f2, '\ "''"')
"             endfor
"         endif
"     endfor
" endfunction
"
" fun! RangerChooser(type)
"     exec "silent !ranger --choosefiles=/tmp/chosenfile " . expand("%:p:h")
"     if filereadable('/tmp/chosenfile')
"         if a:type     == 1
"             exec 'Ewindows ' . system('cat /tmp/chosenfile|tr "\n" " "')
"         elseif a:type == 2
"             exec 'Evwindows ' . system('cat /tmp/chosenfile|tr "\n" " "')
"         elseif a:type == 3
"             exec 'Ebufs ' . system('cat /tmp/chosenfile|tr "\n" " "')
"         else
"             exec 'Etabs ' . system('cat /tmp/chosenfile|tr "\n" " "')
"         endif
"         call system('rm /tmp/chosenfile')
"     endif
"     redraw!
" endfun
"
" map <leader><leader>r :call RangerChooser(3)<CR>
" map <leader>rv :call RangerChooser(2)<CR>
" map <leader>rs :call RangerChooser(1)<CR>
" map <leader>rb :call RangerChooser(3)<CR>
" Enable add multiple files to edit

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
  let projects=['/Users/lcen/workspace/source/macaw-login', '/Users/lcen/workspace/source/passbird', '/Users/lcen/workspace/source/bouncer', '/Users/lcen/workspace/source/macaw-swift']
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

command! ProjectFiles execute 'Files' s:find_project_root()
command! GitRootFiles execute 'Files' s:get_git_root()

nnoremap <silent> <leader>f :ProjectFiles<CR>
nnoremap <silent> <leader>F :GitRootFiles<CR>
" nnoremap <silent> <leader>f :call fzf#run({
"             \   'dir'     : Gitroot(),
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
            \ 'dir':         Gitroot(),
            \ 'source':      'ag "<args>"',
            \ 'sink':        function('AgHandler'),
            \ 'options':     '+m',
            \ 'tmux_height': '60%'
\ })

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

command! -nargs=0 MD
\ | execute ":silent !open -a Marked\\ 2 '%:p'"
\ | execute ':redraw!'

" Format JSON string
com! FormatJSON !python -m json.tool
" }}}
