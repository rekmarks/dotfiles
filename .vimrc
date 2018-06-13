set tabstop=2 "tab length
set softtabstop=2 "tab length
set shiftwidth=2 "shift length?
set expandtab "spaces are tabs
set number "line numbers
set cursorline "highlight current line
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


nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>
