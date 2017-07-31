""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
" Maintainer: Dominic Duxbury                                                "
"        URL: http://github.com/domduxbury/dotfiles                          "
"                                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General {{{

set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
filetype plugin on
set backspace=2 " make backspace work like most other apps

" File searching
set path+=**

" Display all matching files
set wildmenu

" Read the bottom of this file for folding formatting
set modelines=1

" Handle swp, undo and backup files in ~/.vim
" Set swap files dir
set dir=~/.vim/_swap/
" Turn on backup files and set the directory
set backup
set backupdir=~/.vim/_backup/
" Turn on undo files and set the directory
set undofile
set undodir=~/.vim/_undo/

" }}}
" Plugins {{{

filetype off
filetype plugin indent on

" Begin Plugin List
call plug#begin('~/.vim/plugged')

" Lightweight plugin to handle comments
Plug 'tpope/vim-commentary'

" Clean autocomplete plugin
Plug 'shougo/neocomplete.vim'

" Neocomplete Settings
source ~/dotfiles/neocomplete.vim

" Initialize plugin system
call plug#end()

" }}}
" Events {{{
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab

" }}}
" Colours / Theme {{{
let g:solarized_termcolors=256
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
set background=dark
colorscheme solarized       " set colorscheme

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

set pastetoggle=<F2>
" }}}
" Interface {{{
set number                " show line numbers
set numberwidth=6         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set visualbell
" }}}
" Text Formatting/Layout {{{
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
"set smarttab             " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
" }}}
" {{{ Custom Commands, bindings and abbreviations
" Map my leader as ,
let mapleader = ","
let maplocalleader = "-"

" Map # to paste in n or copy in V
" to system clipboard
nnoremap # "+p
vnoremap # "+y

" Map exit to jk, remove esc map and arrows
inoremap jk <esc>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <silent> <C-S> :<C-u>update<CR>

" Map ; to : for faster quitting and writing
" nnoremap ; :

" Use space to open folds
nnoremap <space> za

" Create a mapping to open this file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" create a mapping to source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Latex bindings
au FileType tex nnoremap <localleader>wc :VimtexCountWords<cr>

" Bind leader n/p to next/prev buffer
nnoremap <leader>n :n<cr>
nnoremap <leader>p :prev<cr>

" }}}
" vim:foldmethod=marker:foldlevel=0
