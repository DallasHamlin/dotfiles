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

if version > 800
    Plug 'cometsong/CommentFrame.vim'
endif

Plug 'zhou13/vim-easyescape'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-mucomplete'
Plug 'tpope/vim-commentary'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-unimpaired'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'google/vim-searchindex'
" Plug 'Yggdroot/indentLine'
" Plug 'RRethy/vim-illuminate'
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
" Plug 'dense-analysis/ale'
call plug#end()

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                            Lightline Configuration                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
set laststatus=2
set showtabline=2
let g:lightline#bufferline#show_number = 1
autocmd BufEnter * if len(getbufinfo({'buflisted':1})) > 1 
    \ | set showtabline=2 | else 
    \ | set showtabline=1 | endif

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'relativepath', 'modified' ] ],
    \   'right': [ [ 'lineinfo', 'percent' ] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'gitbranch', 'relativepath','modified' ] ],
    \   'right': [ [ 'lineinfo', 'percent', 'percent' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ [ 'buffers' ] ],
    \   'right': [ [ 'close' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ },
    \ }

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                            Vim Plug Configuration                            "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pg :PlugUpgrade<CR>
nnoremap <leader>ps :PlugStatus<CR>
nnoremap <leader>pd :PlugDiff<CR>
nnoremap <leader>pc :PlugClean<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                              Lens Configuration                              "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:lens#disabled_filetypes = ['fzf']

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                           MuComplete Configuration                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1
let g:mucomplete#no_popup_mappings = 0

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                           Illuminate Configuration                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:Illuminate_delay = 1500
autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                           Easy Align Configuration                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
xmap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               FZF Configuratino                              "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
set rtp+=~/.fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fh :Files ~<CR>
nnoremap <leader>F  :Rg<CR>
nnoremap <leader>fg :GFiles<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_preview_window = ['right:50%','F1']
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
  \ }
" To find hidden files
"let $FZF_DEFAULT_COMMAND = 'find . -type f -not -path "*/\.git/*" 
"    \ -not -path "*/\.ssh/*" -not -path "*/\.config/*"
"    \ -not -path "*/\.local/*" -not -path "*/\.cache/*"
"    \ -not -path "*/\.vim/*"
"    \ -printf "%P\\n"'


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                            Fugitive Configuration                            "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
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
au! BufEnter COMMIT_EDITMSG exec 'norm gg' | startinsert!

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                             Vimtex Configuration                             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:vimtex_view_general_viewer="zathura"
let g:tex_flavor="latex"
let g:vimtex_quickfix_mode=2
let g:tex_conceal='abdmg'
set conceallevel=2
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                            UltiSnips Configuration                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/dotfiles/UltiSnips']
nnoremap <leader>ua :UltiSnipsEdit all<CR>
nnoremap <leader>ul :UltiSnipsEdit tex<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                              Color Configuration                             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
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
let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_hls_cursor = 'purple'
colorscheme gruvbox

" Summerfruit
" let base16colorspace=256
" colorscheme base16-summerfruit-dark

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    General                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" General
set wildmenu        "shows tab completion options in status bar
set number          "line number
" set belloff=all     "disable bell sound
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
set incsearch       "shows what matches as you type the phrase to be searched
set ignorecase      "case insensitive search (use '\C' for case sensitive)
set smartcase       "overrides ignorecase if capital letters present
set showmatch       "shows matching bracket when bracket is inserted
set cursorline nu   "highlight current line number

" Cursor motion
set scrolloff=3                 "min num of screen lines to keep above and below the cursor        
set backspace=indent,eol,start  "allow backspacing over everything in insert mode

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
"                               General Keybinds                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" Exit keybinds
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>

" Normal mode keybinds
" Resize splits
" nnoremap <C-S-J> <C-W>+<CR>
" nnoremap <C-S-K> <C-W>-<CR>

" leader space fix
nnoremap <SPACE> <Nop>

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

" vimrc
nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap <leader>v :e ~/.vimrc<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                Buffer Keybinds                               "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>b! :bd!<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                                    vimdiff                                   "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
if &diff
    syntax off
    " enable to ignore whitespace
    " set diffopt+=iwhite

    " vimdiff colors - good for gruvbox
    " hi DiffAdd      ctermfg=White   ctermbg=Brown
    " hi DiffChange   ctermfg=NONE    ctermbg=NONE
    " hi DiffDelete   ctermfg=NONE    ctermbg=DarkMagenta
    " hi DiffText     ctermfg=White   ctermbg=DarkRed
endif
