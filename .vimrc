"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                  Initialize                                  "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
syntax enable               "enable syntax highlighting
let mapleader=" "           "space as leader
set nocompatible
filetype plugin indent on   "load plugin and indent files

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
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-unimpaired'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
call plug#end()

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
nnoremap <leader>ne :NERDTreeToggle<CR>
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

" Vimtex
let g:vimtex_view_general_viewer="zathura"
let g:tex_flavor="latex"
let g:vimtex_quickfix_mode=2
let g:tex_conceal='abdmg'
set conceallevel=2
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

" ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/dotfiles/UltiSnips']

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
" highlight CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow

" Gruvbox
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_hls_cursor = 'purple'
" colorscheme gruvbox

" Summerfruit
let base16colorspace=256
colorscheme base16-summerfruit-dark

au! BufEnter COMMIT_EDITMSG exec 'norm gg' | startinsert!

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    General                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" General
set wildmenu        "shows tab completion options in status bar
set number          "line number
set belloff=all     "disable bell sound
set encoding=utf-8  "common encoding option
set equalalways     "windows are made the same size after splitting
set ttyfast         "improves rendering
set splitright      "splits a window to right of current one by default
set splitbelow      "splits a window below current one by default

" Whitespace
set wrap            "Allows lines to wrap
set tabstop=4       "Number of spaces that a Tab in the file counts for
set shiftwidth=4    "Number of spaces to use for each step of autoindent (<< or >> in normal mode)
set softtabstop=4   "Number of spaces that a Tab counts for while editing
set expandtab       "Tabs will expand to whitespace characters
set hidden          "hides buffer instead of closing it

" Status line
set showmode        "shows mode in status line
set showcmd         "shows cmd in on the last line
set ruler           "show cursor position in the status bar

" Searching
set hlsearch        "highlights all search patterns
"highlight Search ctermbg=LightYellow ctermfg=Black
set incsearch       "shows what matches as you type the phrase to be searched
set ignorecase      "case insensitive search (use '\C' for case sensitive)
set smartcase       "overrides ignorecase if capital letters present
set showmatch       "shows matching bracket when bracket is inserted

" Cursor motion
set scrolloff=3                 "min num of screen lines to keep above and below the cursor        
set backspace=indent,eol,start  "allow backspacing over everything in insert mode

" color the line number
"highlight LineNr term=bold cterm=NONE ctermfg=blue ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Show relative line numbers in normal mode
" Show actual line numbers in insert mode
augroup numbertoggle
    autocmd!                                                                
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber         
    autocmd BufEnter,FocusGained,InsertLeave * if &nu | set relativenumber | endif           
augroup END

" Formatting
" Prevents vim from creating new lines starting with a comment
set formatoptions=qn1
au FileType * set formatoptions-=r formatoptions-=c formatoptions-=o
set autoindent
set smartindent

" Reopen file at last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif


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

" ultisnips
nnoremap <leader>ua :UltiSnipsEdit all<CR>
nnoremap <leader>ul :UltiSnipsEdit tex<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    vimdiff                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
if &diff
    syntax off
    " enable to ignore whitespace
    " set diffopt+=iwhite

    " vimdiff colors
    hi DiffAdd      ctermfg=White   ctermbg=Brown
    hi DiffChange   ctermfg=NONE    ctermbg=NONE
    hi DiffDelete   ctermfg=NONE    ctermbg=DarkMagenta
    hi DiffText     ctermfg=White   ctermbg=DarkRed
endif
