set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on
filetype plugin indent on
set t_Co=256
syntax on
set background=dark
set ttyfast
colorscheme distinguished 
set number
set tabstop=2
set shiftwidth=2
set softtabstop=0
set smarttab
set expandtab
set scrolloff=5
set backspace=2
set hlsearch
set incsearch
set ignorecase
set lazyredraw
set smartcase
set splitbelow
set splitright
set cul
set dictionary=/usr/share/dict/words

au BufNewFile,BufRead *.ejs set filetype=html
autocmd vimenter * NERDTree 
autocmd VimEnter * wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'maralla/validator'
Plugin 'junegunn/vim-easy-align'
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
let g:user_emmet_install_global = 0
let g:AutoPairsCenterLine=0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:validator_javascript_checkers = ['eslint']
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

let g:syntastic_mode_map = {
  \  "mode": "active",
  \  "active_filetypes": [],
  \  "passive_filetypes": ["html"]}

autocmd FileType html,css,ejs EmmetInstall

nmap <C-l> :vertical resize +5 <CR>
nmap <C-h> :vertical resize -5 <CR>
vnoremap < <gv
vnoremap > >gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>h
nnoremap gp `[v`]
" nnoremap <C-m> o<%= __('') %><Esc>hhhhi
nnoremap <C-n> o$log.debug();<Esc>hi
nnoremap <C-\<> oconsole.log();<Esc>hi
nnoremap <S-s> :noh<return>
" noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
" imap <silent> <Home> <C-O><Home>
noremap <C-S-b> i<return><Esc>
nnoremap <silent> <F2> @=(foldlevel('.')?'za':"\<F2>")<CR>
vnoremap <F2> zf

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
