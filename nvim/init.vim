set incsearch " search as characters are entered
set autoread
let python_host_prog  ="/usr/bin/python2.7"
let python3_host_prog  ="/usr/bin/python3"
set hlsearch  " highlight matches
    set showmatch           " Show matching brackets.
    set number              " Show the line numbers on the left side.
    set ruler
    set formatoptions+=o    " Continue comment marker in new lines.
    set shiftwidth=4        " Indentation amount for < and > commands.
    set autoindent
    set smartindent
    set cindent
    set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
    xnoremap <silent> ( <ESC>:let p = &paste<CR>:set paste<CR>:let a = line2byte(line('.')) + col('.')<CR>gvc()<ESC>:if getregtype() ==# 'V'<CR>call setreg('"', substitute(@", '\n$', '', ''), 'c')<CR>endif<CR>P:exe "goto ".a<CR>:exe "let &paste=".p<CR>
:imap jk <Esc>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" End a line with a semicolon
nnoremap ; <Esc>A;
    " 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl

" double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>
nnoremap ql :silent! normal mpEA"<Esc>bi"<Esc>`pl
" Tabs bruh
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>


nnoremap <C-y> 1gt<CR>
nnoremap <C-x> 2gt<CR>
nnoremap <C-v> 3gt<CR>
nnoremap <C-b> 4gt<CR>
nnoremap <A-n> :tabnext<CR>
nnoremap <A-p> :tabprev<CR>
nnoremap <F1> 1gt<CR>
nnoremap <F2> 2gt<CR>
nnoremap <F3> 3gt<CR>
nnoremap <F4> 4gt<CR>
nnoremap <F5> 5gt<CR>
nnoremap <F6> 6gt<CR>
nnoremap <F7> 7gt<CR>
nnoremap <F8> 8gt<CR>
nnoremap <F9> 9gt<CR>
nnoremap <F0> 10gt<CR>

nnoremap H gT
nnoremap L gt

" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>
"Remove trailing space
autocmd BufWritePre * %s/\s\+$//e
autocmd VimEnter * :filetype detect
autocmd VimEnter * :syntax on
" More natural splits
    set splitbelow          " Horizontal split below current.
    set splitright          " Vertical split to right of current.
    if !&scrolloff
        set scrolloff=5       " Show next 3 lines while scrolling.
    endif
    if !&sidescrolloff
        set sidescrolloff=5   " Show next 5 columns while side-scrolling.
    endif
    set nostartofline       " Do not jump to first character with page commands.
    set mouse=a
    let g:sneak#label = 1
    let g:auto_save = 1  " enable AutoSave on Vim startup
    set clipboard+=unnamedplus
    nnoremap <esc> :noh<CR>

" Plugins

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'scrooloose/nerdtree'

    Plug 'itchyny/lightline.vim'

    Plug '907th/vim-auto-save'

    Plug 'neomake/neomake'

    Plug 'kovetskiy/sxhkd-vim'

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    Plug 'mhinz/vim-startify'

    Plug 'w0rp/ale'

    Plug 'airblade/vim-gitgutter'

    Plug 'zeekay/vim-beautify'

    Plug 'NLKNguyen/papercolor-theme'

    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'tpope/vim-fugitive'

    Plug 'itspriddle/vim-shellcheck'



call plug#end()


" Toggle nerdtree on control-n
map <C-n> :NERDTreeToggle<CR>

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding'], ['filetype','C', 'F', 'Z'] ]
      \ },
      \ }
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override' : {
  \         'color00' : ['#4271ae', '232'],
  \         'linenumber_bg' : ['#4271ae', '232']
  \       }
  \     }
  \   }
  \ }



let g:deoplete#enable_at_startup = 1
let g:deoplete#delimiters = ['/','.']
let g:deoplete#sources#go = 'vim-go'
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Flash screen instead of beep sound
set visualbell

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.


set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
set background=light
set termguicolors

