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

" Python testing
Plug 'PyCQA/pyflakes'

" Python code checker?
Plug 'scrooloose/syntastic'

" Autoclose brackets, etc.
Plug 'Townk/vim-autoclose'

" Vim JS
Plug 'pangloss/vim-javascript'

" Markdown plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Seoul color scheme
Plug 'junegunn/seoul256.vim'

" Initialize plugin system
call plug#end()

"Python: highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" Set up Alt+Left and Alt+Right to move between tabs
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>

" Python: Highlight self and cls keyword in class definitions
augroup python_syntax
  autocmd!
  autocmd FileType python syn keyword pythonBuiltinObj self
  autocmd FileType python syn keyword pythonBuiltinObj cls
augroup end

" Syntax: select global syntax scheme
" Make sure this is at end of section
try
  set t_Co=256 " says terminal has 256 colors
  " set background=dark
  " colorscheme PaperColor

  " " Unified color scheme (default: dark)
  let g:seoul256_background = 234
  colo seoul256

  " Switch
  set background=dark

catch
endtry

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

