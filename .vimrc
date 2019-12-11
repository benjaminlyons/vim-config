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
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://gitlab.com/blyons1/vim-header.git'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on
map <Leader>h :InsertFunctionHeader<CR>
map <Leader>f :InsertFileHeader<CR>

" get gruvbox colorscheme
silent! colorscheme gruvbox
set background=dark

" for solarized
" syntax enable
" set background=dark
" colorscheme solarized


augroup Python
    autocmd!
        autocmd FileType python setlocal expandtab
augroup END
