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
    map <C-n> :NERDTreeToggle<CR>
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
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'itchyny/lightline.vim'
	Plug '907th/vim-auto-save'
	Plug 'neomake/neomake'
	Plug 'kovetskiy/sxhkd-vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'mhinz/vim-startify'
	Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}
	Plug 'w0rp/ale'
	Plug 'airblade/vim-gitgutter'
	Plug 'zeekay/vim-beautify'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" (Optional) Multi-entry selection UI.
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
  \         'color00' : ['#f3f3f3', '232'],
  \         'linenumber_bg' : ['#f3f3f3', '232']
  \       }
  \     }
  \   }
  \ }

let g:deoplete#enable_at_startup = 1

set background=light
set termguicolors

