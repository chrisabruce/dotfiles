call plug#begin()
Plugin 'christoomey/vim-tmux-navigator'

Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'

Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'dag/vim-fish'
call plug#end()

set nocompatible
syntax on
filetype plugin on

" setup colorscheme
set background=dark
colorscheme onedark
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

" Nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

" fzf
nnoremap <C-P> :Files<CR>

" setup rust_analyzer LSP (IDE features)
lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable deoplete autocompletion in Rust files
let g:deoplete#enable_at_startup = 1

" customise deoplete                                                                                                                                                     " maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:rustfmt_autosave = 1

nnoremap <leader>c :!cargo clippy

set number
