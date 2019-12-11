set ignorecase
set incsearch
set number
set relativenumber
inoremap jk <esc>
set hlsearch
set smartcase
set cursorline

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
noremap <silent> <leader><cr> :noh<cr>

" nnoremap B ^
" nnoremap E $
set tabstop=8
set shiftwidth=8
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'https://gitlab.com/blyons1/vim-header.git'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/solarized'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on
map <Leader>h :InsertFunctionHeader<CR>
map <Leader>f :InsertFileHeader<CR>

"This is the vim plugin section
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
" Plug 'morhetz/gruvbox'
call plug#end()

" for lightline display
set laststatus=2
set noshowmode
if !has('gui_running')
	set t_Co=256
endif
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ],
	\		  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'fugitive#head'
	\ },
	\ }

" get gruvbox colorscheme
colorscheme gruvbox
set background=dark

let g:VimHeaderEmails = 'blyons1@nd.edu, mmaldona@nd.edu, sbattali@nd.edu, mkocher2@nd.edu'
let g:VimHeaderNames = 'Ben Lyons, Marina Maldonado, Sam Battalio, Michaela Kocher'

" for solarized
" syntax enable
" set background=dark
" colorscheme solarized


augroup Python
    autocmd!
        autocmd FileType python setlocal expandtab
augroup END
