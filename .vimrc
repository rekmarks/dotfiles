set tabstop=2 "tab length
set softtabstop=2 "tab length
set shiftwidth=2 "shift length?
set expandtab "spaces are tabs
set number "line numbers
set cursorline "highlight current line
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9 "set font?
set nowrap "remove auto wrap
set hlsearch "highlight search
set incsearch "highlight search

" Set column to light grey at 80 characters
" if (exists('+colorcolumn'))
  " set colorcolumn=100
  " highlight CursorColumn ctermbg=248 guibg=Grey
" endif

" This ensures that the indentation for Python is consistent.
augroup indentation_python
	autocmd!
	autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=4
augroup END

" PLUGINS PLUGINS PLUGINS
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Status line / tab line plugin for Vim
Plug 'itchyny/lightline.vim'

" Fancy start screen
Plug 'mhinz/vim-startify'

" Enhanced terminal integration
Plug 'wincent/terminus'

" Indexed search
Plug 'henrik/vim-indexed-search'

" Autocompletion
" Plug 'davidhalter/jedi-vim'

" Rainbow parantheses
Plug 'junegunn/rainbow_parentheses.vim'

" Python syntax
Plug 'hdima/python-syntax'

" Basic coloring
Plug 'NLKNguyen/papercolor-theme'

" Initialize plugin system
call plug#end()

"Python: highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" Add Paper Color to theme via plugin
set background=dark
colorscheme PaperColor


