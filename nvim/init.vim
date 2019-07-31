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
" Map Ctrl-Backspace to delete the previous word in insert mode.
:imap <C-BS> <C-W>
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
nnoremap tj  :tabfirst<CR>
nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap tk  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tr  :tabo<CR>

nnoremap <C-y> 1gt<CR>
nnoremap <C-x> 2gt<CR>
nnoremap <C-b> 4gt<CR>
nnoremap <A-n> :tabnext<CR>
nnoremap <A-p> :tabprev<CR>
nnoremap <A-1> 1gt<CR>
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

    Plug 'airblade/vim-gitgutter'

    Plug 'zeekay/vim-beautify'

    Plug 'NLKNguyen/papercolor-theme'

    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'tpope/vim-fugitive'

    Plug 'magicalbanana/sql-syntax-vim'

    Plug 'itspriddle/vim-shellcheck'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    Plug 'dkarter/bullets.vim'

    Plug 'buoto/gotests-vim'

call plug#end()


" Toggle nerdtree on control-n
map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
autocmd FileType go :let mapleader = ","
autocmd FileType go map <C-i> :GoCallees
autocmd FileType go nnoremap gt :GoTests
autocmd FileType go nnoremap gta :GoTestsAll
autocmd FileType go nnoremap r :GoRename

let g:go_auto_sameids = 1

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

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufEnter * silent! lcd %:p:h
set rtp+=/usr/bin/fzf


" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]


set background=light
set termguicolors

