" Vim settings
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set incsearch
set laststatus=2
set ruler
set wildmenu
set autoread
set number relativenumber
set hlsearch
set clipboard=unnamedplus
"set paste
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

" Cursor shapes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Theming
hi CursorLine cterm=none ctermbg=235 ctermfg=none
"colorscheme wal

" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'haya14busa/incsearch.vim'
Plug 'w0rp/ale'
Plug 'elzr/vim-json'
Plug 'itchyny/lightline.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'christianrondeau/vim-base64'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'suan/vim-instant-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/VisIncr'
Plug 'tpope/vim-obsession'
Plug 'scrooloose/nerdtree'
Plug 'severin-lemaignan/vim-minimap'
call plug#end()

" Plugin settings
let g:ctrlp_map = '<c-n>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = { 
            \ 'AcceptSelection("e")': ['<c-t>'], 
            \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']
            \ }
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:livepreview_previewer = 'mupdf'
let g:lightline = {
            \ 'component_function': {
            \ 'filename': 'FilenameForLightline'
            \   }
            \ }
let g:minimap_toggle='<leader>mm'
let NERDTreeMapActivateNode='l'

" Terminal hacks
map <Esc>[; <C-Semicolon>
map <ESC>Oa <C-Up>
map <ESC>Ob <C-Down>
map <ESC>Oc <C-Right>
map <ESC>Od <C-Left>
map! <ESC>Oa <C-Up>
map! <ESC>Ob <C-Down>
map! <ESC>Oc <C-Right>
map! <ESC>Od <C-Left>

" Vim hacks
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
cmap w!! w !sudo tee > /dev/null %
inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" Plugin keybindings
map <Leader> <Plug>(easymotion-prefix)
map <C-g> :Goyo<CR>
map <C-f> :call JsBeautify()<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <C-p> :CtrlPBuffer<CR>
map <C-n> :CtrlP<CR>
nmap <C-_> gcc<Esc>
vmap <C-_> gcc<Esc>
map <C-m> :MinimapToggle<CR>

" Normal keybindings
nmap <CR> o<Esc>
map <C-Semicolon> :noh<CR>
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-l> <C-W><C-L>
nmap <C-h> <C-W><C-H>
nmap J gt
nmap K gT
map ZZ :wqa<CR>
map gn :tabe<CR>

" Commands
command! ReloadConfig :so ~/.vimrc

" Functions
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

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction
