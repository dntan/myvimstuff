"AutoComplPop
set completeopt=menuone,longest
" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Don't select line numbers when copying.
set mouse+=a

" save undo,undo and swapfiles in folders
set directory=~/.vim/swapfiles/
set undodir=~/.vim/undo/     
set backupdir=~/.vim/backup/

"vimPolygot
set nocompatible

"NERDTree
"autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
     \ && b:NERDTree.isTabTree()) | q | endif
noremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"lightline vim config
set laststatus=2

"ALE plugin config

nmap <silent> <C-e> <Plug>(ale_next_wrap)

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'html': ['prettier']
\}

"Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0

"Indentline config #start

"Exclusions
let g:indentLine_fileTypeExclude = ["help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]

"Conceal settings
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "inc"
let g:indentLine_concealLevel = 2

"leadingSpace
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = "·"

"let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Vim
let g:indentLine_color_term = 239

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

"Tab settings
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"Indentline config #end

"-- EMMET CONFIG --
"redefine trigger key
let g:user_emmet_leader_key=','

call plug#begin()
Plug 'vim-scripts/AutoComplPop'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

"Danny Vim Settings
set number
set wrap
set nobackup

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
