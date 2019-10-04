
" Migration command for neovim
" cp .vimrc ~/config/nvim/init.vim

set tabstop=2 "tab length
set softtabstop=2 "tab length
set shiftwidth=2 "shift length
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

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace' " Trailing whitespace
Plug 'itchyny/lightline.vim' " Status line / tab line plugin for Vim
Plug 'mhinz/vim-startify' " Fancy start screen
Plug 'wincent/terminus' " Enhanced terminal integration
Plug 'henrik/vim-indexed-search' " Indexed search
" Plug 'davidhalter/jedi-vim' " Autocompletion
Plug 'hdima/python-syntax' " Python syntax
Plug 'PyCQA/pyflakes' " Python testing
Plug 'scrooloose/syntastic' " Python code checker?
Plug 'Townk/vim-autoclose' " Autoclose brackets, etc.
Plug 'godlygeek/tabular' " Markdown plugin
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'hynek/vim-python-pep8-indent'
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript' " JavaScript syntax
Plug 'mxw/vim-jsx' " JSX syntax
Plug 'moll/vim-node' " Node plugin
Plug 'heavenshell/vim-jsdoc' " JSDoc generation
Plug 'lifepillar/vim-solarized8' " Solarized color scheme
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomlion/vim-solidity' " Solidity syntax
Plug 'elzr/vim-json' " JSON syntax

call plug#end()

" PLUGIN CONFIGURATION
" deoplete and autocompletion
let g:deoplete#enable_at_startup=1
set completeopt+=noinsert

"vim-jsdoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_enable_es6=1

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-E>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" vim-json
let g:vim_json_syntax_conceal = 0

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

" Python: add python to Neovim
let g:python3_host_prog='/Users/rekmarks/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog='/Users/rekmarks/.pyenv/versions/neovim2/bin/python'

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
  set background=dark
  colorscheme solarized8
catch
endtry

" JavaScript:
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
