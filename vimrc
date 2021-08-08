"Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting, and select color scheme
syntax on

" For plug-ins to load correctly.
"filetype plug-in indent on


" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tqn1

" tab character width
set tabstop=4
" indent width
set shiftwidth=4
" simulated tab width if different from [tabstop] (with combination of space and tab character)
set softtabstop=4
" Use space character to simulate tab character
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Smart indent
set smartindent
set autoindent

" Highlight the 80th column, should not code over this column
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number
set relativenumber

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" Delete to blackhole, (not to register)
nnoremap d "_d
vnoremap d "_d

" paste without copying
vnoremap p "_dP

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=~/.vim/undo  "directory where the undo files will be stored
  endif


call plug#begin('~/.vim/plugged')
" colorschemes
Plug 'morhetz/gruvbox'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'crusoexia/vim-monokai'

" syntax files
Plug 'vim-python/python-syntax'

Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
" Plug 'ycm-core/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark


let g:python_highlight_all = 1
let mapleader = " "

" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = '/home/jianlan/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_use_caching = 0

let g:netrw_browse_split = 2
let g:netrw_winsize = 25

nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>l :wincmd l<CR>
" Use F9 to save and run current file
nnoremap <F9> :!%:p<Enter>


" goto definition
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
