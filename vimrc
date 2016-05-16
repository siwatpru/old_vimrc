"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number
set t_Co=256
let mapleader=","

" Change buffer without closing them
set hidden

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Change indent based on file type
autocmd BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile *.js,*.html,*.scss set shiftwidth=2 tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

"Auto indent, Smart indent, Wrap lines
set ai
set si
set wrap

" Enter to add new line
nmap <CR> o<Esc>k

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste monde with F2
set pastetoggle=<F2>
nnoremap <silent> <space> :noh<CR>

" Highlight stupid whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" Change parenthesis color
highlight MatchParen cterm=bold ctermbg=yellow

" Change highlight color when goes to next search result
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>
function! HLNext (blinktime)
  let target_pat='\c\%#'.@/
  let ring=matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" Navigate split easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_open_multiple_files = 'ij'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/flask,*/node_modules

" NERD tree
nmap <silent> <C-T> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']
let NERDTreeQuitOnOpen=1

" Airline
set laststatus=2
let g:airline_theme='light'
let g:airline_powerline_fonts=1
set guifont=Sauce_Code_Powerline:h10
let g:airline#extensions#branch#enabled=1

" BufExplorer
nmap <leader>e :BufExplorer<CR>

" Fugitive
set diffopt+=vertical

" nerdcommenter
filetype plugin on
