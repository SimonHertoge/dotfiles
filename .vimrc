"" Vim settings
set encoding=UTF-8
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
" set incsearch
set laststatus=2
set ruler
set wildmenu
set autoread
set number relativenumber
set hlsearch
set clipboard=unnamedplus
" set paste
set pastetoggle=<F10>
set go+=a
set whichwrap+=<,>,[,]
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=3
set noshowmode
set ignorecase
set smartcase
set cursorline
set ttimeoutlen=0
set splitbelow
set splitright
set hidden
set background=dark
set mouse=a
set termguicolors
set shell=bash
set undodir=~/.vim/undo
set undofile
set showcmd
set guioptions -=m
set guioptions -=T
set guioptions -=r

"" Cursor shapes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'ajh17/VimCompletesMe'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json'
Plug 'vim-airline/vim-airline'
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'suan/vim-instant-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-obsession'
Plug 'scrooloose/nerdtree'
Plug 'severin-lemaignan/vim-minimap'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'w0rp/ale'
Plug 'ap/vim-css-color'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'jlanzarotta/bufexplorer'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-titlecase'
Plug 'tommcdo/vim-lion'
Plug 'simnalamburt/vim-mundo'
Plug 'dyng/ctrlsf.vim'
Plug 'sunaku/vim-shortcut'
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'svermeulen/vim-easyclip'
Plug 'haya14busa/incsearch.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'davidhalter/jedi-vim'
" Plug 'chrisbra/Recover.vim'
" Plug 'kshenoy/vim-signature'
" Plug 'junegunn/vim-peekaboo'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

"" Plugin settings
let NERDTreeMapActivateNode='l'
let g:airline_powerline_fonts = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
" Bypasses bug with C-BS / C-w
let g:AutoPairsMapCh = 0
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipAutoFormat = 1
let g:AutoPairs = {'{':'}'}
let g:incsearch#auto_nohlsearch = 0
let g:polyglot_disabled = ['latex']

"" Theming
hi CursorLine cterm=none ctermbg=235 ctermfg=none
" colorscheme wal
colorscheme gruvbox

"" Keybindings
cmap <C-h> <C-w>
cmap <C-j> <C-n>
cmap <C-k> <C-p>
cmap nl normal
cmap w!! w !sudo tee > /dev/null %
imap <C-a> <Esc>ggVG
inoremap <C-h> <C-w>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nmap <BS> i<BS><Esc>l
nmap <C-g> :Goyo<CR>
nmap <C-p> :Buffers<CR>
nmap <CR> o<Esc>
nmap <F1> :NERDTreeToggle<CR>
nmap <F2> :BufExplorerHorizontalSplit<CR>
nmap <F3> :MinimapToggle<CR>
nmap <F4> :MundoToggle<CR>
nmap <F5> :TagbarToggle<CR>
nmap <Space> i <Esc>l
nmap <leader>j :call JsBeautify()<CR>
nmap <leader>r :NERDTreeFind<CR>
nmap <leader>s :sort<CR>
nmap <leader>w :StripWhitespace<CR>
nmap ZZ :wqa<CR>
nmap gn :tabe<CR>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap J gt
nnoremap K gT
nnoremap gm m
vmap <C-c> y
vmap gx ::normal gx<CR>

"" Vim hacks
nmap <C-_> gcc<Esc>
vmap <C-_> gcc<Esc>
" .Xdefaults mappings
" Ctrl-Semicolon
set <F13>=^[[25~
nmap <F13> :noh<CR>
" Ctrl-Enter
set <F14>=^[[26~
nmap <F14> o<Esc>
" Ctrl-Shift-Enter
set <F15>=^[[27~
nmap <F15> O<Esc>

"" GVim keybindings
nmap <C-CR> o<Esc>
nmap <C-S-CR> O<Esc>
nmap <C-f> :promptfind<CR>

"" Build configs
au FileType python map <F9> :w !python<CR>
au FileType vim    map <F9> :w<CR>:ReloadConfig<CR>:PlugInstall<CR>

"" Triggers
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au VimResized * wincmd =

"" Commands
command! ReloadConfig :so ~/.vimrc

"" Functions
" mkdir parent folder if not exists
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
