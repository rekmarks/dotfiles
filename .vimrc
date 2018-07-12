" set tabstop=2 "tab length
" set softtabstop=2 "tab length
" set shiftwidth=2 "shift length
set showtabline=2 "show tab dif
set expandtab "spaces are tabs
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

" This ensures that the indentation for Python is consistent.
" augroup indentation_python
"	autocmd!
"	autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
" augroup END

augroup indentation_sr
  autocmd!
  autocmd Filetype * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
  autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype yaml setlocal indentkeys-=<:>
augroup END

" PLUGINS PLUGINS PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace' " Trailing whitespace
Plug 'itchyny/lightline.vim' " Status line / tab line plugin for Vim
Plug 'mhinz/vim-startify' " Fancy start screen
Plug 'wincent/terminus' " Enhanced terminal integration
Plug 'henrik/vim-indexed-search' " Indexed search
" Plug 'davidhalter/jedi-vim' " Autocompletion
Plug 'hdima/python-syntax' " Python syntax
" Plug 'NLKNguyen/papercolor-theme' " Basic coloring
Plug 'PyCQA/pyflakes' " Python testing
Plug 'scrooloose/syntastic' " Python code checker?
Plug 'Townk/vim-autoclose' " Autoclose brackets, etc.
Plug 'pangloss/vim-javascript' " Vim JS
Plug 'godlygeek/tabular' " Markdown plugin
Plug 'plasticboy/vim-markdown' " Markdown plugin
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'junegunn/seoul256.vim' " Seoul color scheme
Plug 'hynek/vim-python-pep8-indent'
Plug 'Yggdroot/indentLine'

call plug#end()

"Python: highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" Set up Alt+Left and Alt+Right to move between tabs
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>

" Set up TAB to move between tabs
noremap <TAB> <C-W>w

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
  let g:seoul256_background = 235
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
