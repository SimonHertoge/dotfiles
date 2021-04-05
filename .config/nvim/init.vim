"" Vim settings
set encoding=UTF-8
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set incsearch
set laststatus=2
set ruler
set wildmenu
set autoread
set number
set hlsearch
set clipboard=unnamedplus
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
set lazyredraw

"" GVim specific
"set guioptions -=m
"set guioptions -=T
"set guioptions -=r

"" Cursor shapes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json'
Plug 'vim-airline/vim-airline'
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'scrooloose/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ap/vim-css-color'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-repeat'
Plug 'jlanzarotta/bufexplorer'
Plug 'christoomey/vim-titlecase'
Plug 'junegunn/vim-easy-align'
Plug 'subnut/visualstar.vim'
"Plug 'w0rp/ale'
"Plug 'dyng/ctrlsf.vim'
"Plug 'ervandew/supertab'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'ajh17/VimCompletesMe'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

"" Plugin settings
let NERDTreeMapActivateNode='l'
let g:airline_powerline_fonts = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
let g:markdown_fenced_languages = ['html', 'css', 'python', 'bash=sh', 'js=javascript', 'rust', 'xml']

"" Keybindings
nnoremap J gt
nnoremap K gT
map <C-_> gcc<Esc>
vmap gx ::normal gx<CR>
cmap w!! w !sudo tee > /dev/null %
nnoremap <C-h> <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <C-g> :Goyo<CR>
nmap <C-p> :Buffers<CR>
nmap <F1> :NERDTreeToggle<CR>
nmap <F2> :BufExplorerHorizontalSplit<CR>
nmap <F3> :TagbarToggle<CR>
nmap <leader>j :call JsBeautify()<CR>
nmap <leader>r :NERDTreeFind<CR>
nmap <leader>s :sort<CR>
nmap <leader>w :StripWhitespace<CR>

"" urxvt .Xresources mappings
" Ctrl-Semicolon
set <F13>=^[[25~
nmap <F13> :noh<CR>
" Ctrl-Enter
set <F14>=^[[26~
nmap <F14> o<Esc>
" Ctrl-Shift-Enter
set <F15>=^[[27~
nmap <F15> O<Esc>
" Ctrl-Backspace
set <F16>=^[[28~
imap <F16> <C-W>

"" GVim keybindings
if has("gui_running")
    nmap <C-CR> o<Esc>
    nmap <C-S-CR> O<Esc>
    nmap <C-f> :promptfind<CR>
endif

"" Build configs
au FileType python map <F9> :w !python<CR>
au FileType vim    map <F9> :w<CR>:ReloadConfig<CR>:PlugInstall<CR>

"" Triggers
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au ColorScheme * :hi clear CursorLine | :hi CursorLine gui=underline cterm=underline

"" Commands
command! ReloadConfig :so ~/.config/nvim/init.vim

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

"" Theming
"colorscheme wal
"colorscheme gruvbox
colorscheme industry

