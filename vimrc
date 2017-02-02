"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline-themes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'edkolev/tmuxline.vim'
Plugin 'eugen0329/vim-esearch'
Plugin 'haya14busa/vim-operator-flashy'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kana/vim-operator-user'
Plugin 'mhinz/vim-startify'
Plugin 'moll/vim-node'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'rust-lang/rust.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thinca/vim-quickrun'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'vimwiki/vimwiki'

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
" Set encoding
set encoding=utf8

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

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

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
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'
set guifont=Sauce_Code_Powerline:h10
let g:airline#extensions#branch#enabled=1

" Tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#W',
      \'cwin' : '#W',
      \'y'    : '#(date)',
      \'z'    : ['#(whoami)'],
      \ 'options': {'status-justify': 'left'}
      \}

" Fugitive
set diffopt+=vertical

" nerdcommenter
filetype plugin on

" Buffergator
let g:buffergator_split_size=100
let g:buffergator_show_full_directory_path=0
let g:buffergator_sort_regime='mru'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = { 'mode': 'passive'}
map <Leader>m :SyntasticCheck<CR>
map <Leader>mm :SyntasticReset<CR>

" Vim-Esearch
hi ESearchMatch ctermfg=black ctermbg=yellow guifg=#000000 guibg=#E6E6FA

" vim-operator-flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
let g:operator#flashy#flash_time=50

" vim-easymotion
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen
hi link EasyMotionMoveHL Search

" vim-startify
let g:startify_change_to_dir=0
