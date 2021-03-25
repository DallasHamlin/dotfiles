"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                  Initialize                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let mapleader=" "
set nocompatible
filetype plugin indent on
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    Plugins                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'psliwka/vim-smoothie'
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
Plug 'cometsong/CommentFrame.vim'
Plug 'zhou13/vim-easyescape'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-mucomplete'
" Plug 'RRethy/vim-illuminate'
Plug 'tpope/vim-commentary'
" Plug 'dense-analysis/ale'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
call plug#end()

" Smoothie
" let g:smoothie_enabled = 0
let g:smoothie_update_interval = 40
let g:smoothie_speed_constant_factor = 15
let g:smoothie_speed_linear_factor = 15
let g:smoothie_speed_exponentiation_factor = 0.9

" Vim plug
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pg :PlugUpgrade<CR>
nnoremap <leader>ps :PlugStatus<CR>
nnoremap <leader>pd :PlugDiff<CR>
nnoremap <leader>pc :PlugClean<CR>

" Lens
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']

" Mucomplete
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1
let g:mucomplete#no_popup_mappings = 0

" Illuminate
let g:Illuminate_delay = 800
autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline

" Easy align
xmap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" FZF   
set rtp+=~/.fzf
nnoremap <leader>fc :FZF<CR>
nnoremap <leader>ff :FZF 
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
  \ }

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>
" enable these two to automatically enable NerdTree upon entering a vim file
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

" Airline
let g:airline_extensions = []
let g:airline#extensions#searchcount#enabled = 0
let g:airline_section_b=''                              " disable git branch
let g:airline#extensions#whitespace#enabled = 0         " disable last section
silent! call airline#extensions#whitespace#disable()    " disable last section
let g:airline#extensions#hunks#enabled=0                " disable changed hunks
let g:airline#extensions#branch#enabled=1               " show git branch
let g:airline_section_y=''                              " skip encoding section
let g:airline_skip_empty_sections=1                     " skip empty sections
let g:airline#extensions#tabline#enabled=1              " enable tab/buffer line
let g:airline#extensions#tabline#show_close_button=0    " hide close button
let g:airline#extensions#tabline#tabs_label=''          " remove tabs label
let g:airline#extensions#tabline#buffers_label=''       " remove buffer label
let g:airline#extensions#tabline#fnamemod=':t'          " remove paths to files
let g:airline#extensions#tabline#tab_min_count=2        " 2 tabs to enable
let g:airline#extensions#tabline#buffer_min_count=2     " 2 bufs to enable
let g:airline_powerline_fonts = 1

" Fugitive
set previewheight=100
nnoremap <leader>gs  :Git<CR>:only<CR>
nnoremap <leader>gp  :Git push <CR>
nnoremap <leader>gf  :Git fetch -p <CR>
nnoremap <leader>gl  :Git log <CR> :only <CR>
nnoremap <leader>go  :Git log -p % <CR>
" nnoremap <leader>gd  :BranchCalcOverride <CR> :Gvdiffsplit!<C-R>d
" nnoremap <leader>gt  :BranchReturn <CR> :<C-R>b<CR> :ClearClose<CR> :Git diff-tree -r <C-R>a <C-R>c %
" Checkout git branch launched from BranchCalc()
" nnoremap <leader>gc  :BranchReturn <CR> :<C-R>b<CR> :ClearClose<CR> :Git checkout <C-R>c
" nnoremap <leader>gb  :BranchCalc <CR>
" Note that Vim-Fugitive uses //2 and //3 for 3-way diff puts/gets
nnoremap <leader>gdh  :diffget //2 <CR>
nnoremap <leader>gdl  :diffget //3 <CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    Colors                                    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" color options
set t_Co=256
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
let &t_TI = ""
let &t_TE = ""
set termguicolors
set background=dark

" Change current line number color in normal mode
highlight CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow

" Gruvbox
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_hls_cursor = 'purple'
colorscheme gruvbox

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    General                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
syntax enable

" show and color line number 
set number
"highlight LineNr term=bold cterm=NONE ctermfg=blue ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Show relative line numbers in normal mode
" Show actual line numbers in insert mode
augroup numbertoggle
    autocmd!                                                                
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber         
    autocmd BufEnter,FocusGained,InsertLeave * if &nu | set relativenumber | endif           
augroup END

set ruler
set belloff=all
set encoding=utf-8
set noea

" Whitespace
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Last line
set showmode
set showcmd

" Searching
set hlsearch
"highlight Search ctermbg=LightYellow ctermfg=Black
set incsearch
set ignorecase
set smartcase
set showmatch

" Formatting
set formatoptions=qn1
au FileType * setlocal formatoptions-=r formatoptions-=c formatoptions-=o
set autoindent
set smartindent

" Reopen file at last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

" if lens and animate commented
set ea
set splitright
set splitbelow

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                   Keybinds                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" Normal mode keybinds
" Resize splits
" nnoremap <C-S-J> <C-W>+<CR>
" nnoremap <C-S-K> <C-W>-<CR>

" leader space fix
nnoremap <SPACE> <Nop>

" exiting/saving file
nnoremap <leader>q :q<CR>
nnoremap <leader>! :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>

" term
nnoremap <leader>t :term<CR>
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l

" highlight search toggle
nnoremap <leader>h :<C-U>set hlsearch! hlsearch?<CR>:echo<CR>

" toggle line numbers
nnoremap <leader>nu :set nu! nu?<CR>:set rnu! rnu?<CR>:echo<CR>

" window swaps in the direction chosen
nnoremap <leader>mh <C-w>H
nnoremap <leader>mj <C-w>J
nnoremap <leader>mk <C-w>K
nnoremap <leader>ml <C-w>L
" window swap current with next one
nnoremap <leader>mx <C-w>x
" window swap rotate
nnoremap <leader>mr <C-w>r

" move windows
nnoremap <leader>K <C-w>8+<CR>
nnoremap <leader>J <C-w>8-<CR>

" buffer mappings
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>b! :bd!<CR>

nnoremap <leader>b1 :b1<CR>
nnoremap <leader>b2 :b2<CR>
nnoremap <leader>b3 :b3<CR>
nnoremap <leader>b4 :b4<CR>
nnoremap <leader>b5 :b5<CR>
nnoremap <leader>b6 :b6<CR>
nnoremap <leader>b7 :b7<CR>
nnoremap <leader>b8 :b8<CR>
nnoremap <leader>b9 :b9<CR>

" vimrc
nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap <leader>s :e ~/.vimrc<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    vimdiff                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
if &diff
    map ] ]c
    map [ [c
    syntax off

    " enable to ignore whitespace
    " set diffopt+=iwhite

    " vimdiff colors
    hi DiffAdd      ctermfg=White   ctermbg=Brown
    hi DiffChange   ctermfg=NONE    ctermbg=NONE
    hi DiffDelete   ctermfg=NONE    ctermbg=DarkMagenta
    hi DiffText     ctermfg=White   ctermbg=DarkRed
endif
