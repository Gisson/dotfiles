set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
"Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'tpope/vim-surround'
Plugin 'hashivim/vim-terraform'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/syntastic'
Plugin 'glench/vim-jinja2-syntax'
"Plugin 'scrooloose/syntastic'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"syntax stuff
syntax on

"tabs with size 4
set tabstop=4
set shiftwidth=4

"show characters like tabs and spaces
set nolist
"set listchars=tab:>\ ,trail:·,nbsp:·
map <C-n> :NERDTreeToggle<CR>



" vim-latexc-live-preview configs
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex'



" vim-terraform
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_remap_spacebar=0
let g:terraform_fmt_on_save=1


filetype indent on

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']
let g:syntastic_python_checkers = ['pylint']
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" speller
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
set spell spelllang=en_gb
set spell!

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let g:go_version_warning = 0


set tabstop=4 shiftwidth=2 expandtab

color delek
set number
set backspace=indent,eol,start
