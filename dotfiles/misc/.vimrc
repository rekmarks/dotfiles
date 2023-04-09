" Migration command for neovim
" cp .vimrc ~/config/nvim/init.vim

set tabstop=2 "tab length
set softtabstop=2 "tab length
set shiftwidth=2 "shift length
set showtabline=2 "show tab dif
set expandtab "spaces are tabs
set autoindent "auto indent
set smartindent "smart auto indent, should be used with autoindent
set number "line numbers
set cursorline "highlight current line
set nowrap "remove auto wrap
set hlsearch "highlight search
set incsearch "highlight search
set noswapfile "avoid swap files
set nobackup "avoid swap files

" Set column to light grey at 80 characters
 if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight CursorColumn ctermbg=248 guibg=Grey
 endif

" Ensure consistent indentation for various file types
augroup indentation_sr
  autocmd!
  autocmd Filetype * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
  autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype rust setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype yaml setlocal indentkeys-=<:>
augroup END

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace' " Trailing whitespace
Plug 'itchyny/lightline.vim' " Status line / tab line plugin for Vim
Plug 'wincent/terminus' " Enhanced terminal integration
Plug 'henrik/vim-indexed-search' " Indexed search
Plug 'hdima/python-syntax' " Python syntax
Plug 'jiangmiao/auto-pairs' " Autoclose brackets, etc.
Plug 'godlygeek/tabular' " Markdown plugin
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'Yggdroot/indentLine' " Dotted lines tracking indentation levels
Plug 'pangloss/vim-javascript' " JavaScript syntax
Plug 'mxw/vim-jsx' " JSX syntax
Plug 'elzr/vim-json' " JSON syntax
Plug 'ianks/vim-tsx' " .tsx syntax
Plug 'moll/vim-node' " Node plugin
Plug 'lifepillar/vim-solarized8' " Solarized color scheme
Plug 'tomlion/vim-solidity' " Solidity syntax
Plug 'rust-lang/rust.vim' " Rust syntax

call plug#end()

" PLUGIN CONFIGURATION

" vim-json
let g:vim_json_syntax_conceal=0

" KEY BINDINGS
" Switching between tabs
nnoremap † :tabnext<CR>
nnoremap ® :tabprevious<CR>

" easy copy paste
nnoremap ç "+y
nnoremap √ "+p

" autocompletion popup navigation
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <C-r> pumvisible() ? "\<C-p>" : "\<C-r>"

" hjkl navigation during insertion
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Python: highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" Syntax: select global syntax scheme
" Make sure this is at end of section
try
  set t_Co=256 " says terminal has 256 colors
  set background=dark
  colorscheme solarized8
catch
endtry

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
