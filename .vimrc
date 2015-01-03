" General
set hls
set nowrap
if &term == "xterm" || &term == "screen" || &term == "screen-256color" || &term == "xterm-256color"
    set t_Co=256
    let g:jellybeans_background_color_256="NONE"
    silent! colorscheme jellybeans
endif

colorscheme desert

" Vundle Plugin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
			
" Lightline plugin
set laststatus=2

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \   'component_function': { 'fugitive': 'fugitive#statusline' }
      \ }


if &t_Co == 256
	    let g:lightline.colorscheme = 'jellybeans'
endif

" NerdTree plugin
map <F3> :NERDTree<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Python-mode
" Keys:
" K             Show python docs
" <Ctrl-Space>  Jedi autocomplete
" <Leader>g     Goto assignments
" <Leader>d     Jedi goto definition
" <Leader>n     Jedi find occurrences
" <Leader>r     Jedi rename
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" ]]            Jump on next class or function (normal, visual, operator
" [M            Jump on previous class or method (normal, visual, operator
" ]M            Jump on next class or method (normal, visual, operator
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

set tabstop=4
set shiftwidth=4
set expandtab

" more subtle popup colors 
if has ('gui_running')
	highlight Pmenu guibg=#cccccc gui=bold    
endif
