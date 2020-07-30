"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    BASE OPTIONS                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bright future
set nocompatible

" match more than brackets
packadd! matchit

" Enable filetype plugins
filetype plugin indent on

" line numbers
set number

" enable mouse in all modes
set mouse=a

" line and column number
set ruler
" set rulerformat=Line:\ %l,\ Column:\ %c

" always show status line
set laststatus=2
" set statusline=Line:\ %l,\ Column:\ %c

" default copying to clipboard register
" ctrl-v register
" set clipboard=unnamedplus
" middle button mouse register
set clipboard=unnamed

" autoread when file changed from outside
set autoread
set autowrite

syntax enable

" command history
set history=1000

set tabpagemax=20

" Maintain undo history between sessions
set undofile

" russian layout on ctrl+^
set keymap=russian-jcukenwin
" english layout is default
set iminsert=0
set imsearch=0

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" tab-completion in command line
set wildmenu

" show executing command
" set showcmd

" don't show "search hit BOTTOM..."
set shortmess+=s
" <truncate file message at the start if it is too long to fit
set shortmess+=t
" truncate other messages in the middle if they are too long to...
set shortmess+=T
" don't give "written" or "[w]" when writing a file
set shortmess+=W

" don't insert autocomplete automatically
set completeopt+=noinsert

" Don't redraw while executing macros (good performance config)
set lazyredraw

" better performance
" set regexpengine=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set belloff=all
" set t_vb=

" With a map leader it's possible to do extra key combinations
let mapleader = " "

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab

" folding by syntax is slow
" set foldmethod=indent

" timeout after key pressing in mappings (default is 1000 ms)
set timeoutlen=2000
" timeout after key codes (Esc)
set ttimeoutlen=200

set splitright
set splitbelow

" prompt to save file
set confirm

set backspace=indent,eol,start

set nrformats-=octal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    SEARCH                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase

set infercase

" turn off ignorecase if Uppercase letter in search string
set smartcase

" highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" less escaping in regexp
set magic

" show matching brackets when text indicator is over them
set showmatch
" tenths of a second to blink when matching brackets
" set matchtime=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    INDENTATION                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent
set autoindent

" Smart indent
set smartindent

" disable wrap lines
set nowrap
" move as usual when scrolling horizontally
set sidescroll=1
" leave a bit of lines or columns when scrolling
set sidescrolloff=5
set scrolloff=1

" minimal window size
set winwidth=50
set winheight=25

" delete comment character when joining commented lines
set formatoptions+=j

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    COLOR SCHEME                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" true color support
set termguicolors

set background=dark

" vertical rulers
highlight ColorColumn guibg=#2c2c2c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    KEY MAPPINGS                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" no pain, no gain
" noremap <Left>  <nop>
" noremap <Right> <nop>
" noremap <Up>    <nop>
" noremap <Down>  <nop>

" scroll screen with centering current line
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap <C-b> <C-b>zz
noremap <C-f> <C-f>zz

" disable ctrl+arrows `deleting` behavior
set term=xterm-256color
" jumplist navigation
noremap <C-Left> <C-o>
noremap <C-Right> <C-i>


" Smart way to move between windows
noremap               <leader><Up>                 <C-W>k
noremap <leader><Left>                             <C-W>h
noremap                           <leader><Right>  <C-W>l
noremap              <leader><Down>                <C-W>j

noremap <silent> <leader>w :set wrap!<cr>

" window splitting
noremap <leader>v :vsplit<cr>
noremap <leader>h :split<cr>

fun! TabIsNew()
    " full path length
    return len(expand('%:p')) == 0
endfun

fun! BufferIsLast()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
endfun

" leader-s saving
" noremap <expr> <leader>s TabIsNew() ? ':w! ' : ':w!<cr>'

" leader-tn opening new tab
noremap <expr> <leader>tn ':tabnew '

" ctrl+d closing buffer
" noremap <silent> <expr> <C-d> BufferIsLast() ? ':q<cr>' : ':bdelete!<cr>'
" noremap <silent> <expr> <C-d> tabpagenr('$') == 1 ? ':q!<cr>' : ':tabclose!<cr>'

" disable search highlighting
nmap <silent> <leader>l :let @/ = ""<cr>

set listchars=eol:$,tab:>-,trail:·,extends:>,precedes:<

" highlight invisible symbols
nmap <silent> <leader>L :set list!<cr>

" yanking and pasting to clipboard
nmap <silent> <leader>y "+y
vmap <silent> <leader>y "+y
nmap <silent> <leader>p "+p

" put any text on next/previous line
" nmap <silent> <leader>p :put<cr>
" nmap <silent> <leader>P :put!<cr>

" fast space add
nmap <silent> <leader>a :normal a <cr>

nmap <silent> <leader>r :set relativenumber!<cr>

" Edit .vimrc
command! VEdit :vsplit $MYVIMRC

" Reload .vimrc
command! VReload :source $MYVIMRC

" :W sudo saves the file with wrong permissions
command! W w !sudo tee % > /dev/null

" * highlight word under cursor without jumping
nnoremap * *N

" :h<space> converts to :vert bo help
cabbrev h vert bo help

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    PLUGINS CONFIGURATION                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
    silent! !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs
                      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'maximbaz/lightline-ale'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-rooter'
Plug 'sheerun/vim-polyglot'
call plug#end()

" vim-rooter ------------------------------------------

let g:rooter_silent_chdir = 1

" ale -------------------------------------------------

" let g:ale_sign_error = "\uf05e"
" let g:ale_sign_warning = "\uf071"
nmap <silent> [a <Plug>(ale_previous_wrap_error)
nmap <silent> ]a <Plug>(ale_next_wrap_error)

" vim-better-whitespace -------------------------------

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:better_whitespace_operator = '<leader>s'
let g:strip_only_modified_lines = 1
let g:strip_whitespace_confirm = 0
nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>

highlight ExtraWhitespace cterm=underline guifg=Red

" gruvbox-material ------------------------------------

let g:gruvbox_material_enable_bold = 1
" let g:gruvbox_material_palette = 'original'

" TODO: set spell not working
silent! colorscheme gruvbox-material

" transparent background
" highlight Normal guibg=NONE ctermbg=NONE

" Goyo (zen-mode) -------------------------------------

noremap <silent> <leader>z :Goyo<cr>
let g:goyo_width = 101
let g:goyo_height = 88

" Limelight -------------------------------------------

autocmd! User GoyoEnter Limelight | setlocal nocursorline colorcolumn=
autocmd! User GoyoLeave Limelight!

" Lightline -------------------------------------------

" because lightline plugin doing it already
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ],
      \              [ 'linter_errors' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component_expand': {
      \   'linter_errors': 'lightline#ale#errors',
      \ },
      \ 'component_type': {
      \   'linter_errors': 'error',
      \ },
      \ }

" FZF -------------------------------------------------

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Customize fzf colors to match color scheme
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
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

" Raw version of Ag.
command! -nargs=+ -complete=file Rag call fzf#vim#ag_raw(<q-args>)
cnoreabbrev rg <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Rag' : 'rg')<cr>

" Files command with autocomplete and preview window
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" leader-ff search all open buFfers contents
noremap <expr> <silent> <leader>ff BufferIsLast() ? ':BLines<cr>' : ':Lines<cr>'
" leader-F recursive search in Files in current directory
noremap <silent> <leader>F :Rg<cr>
" leader-fh search file History
noremap <silent> <leader>fh :History<cr>
" leader-fF search Files
noremap <expr> <leader>fF ':Files '
" leader-fc search Command history
noremap <silent> <leader>fc :History:<cr>
" leader-fs search Search history
noremap <silent> <leader>fs :History/<cr>
" leader-fb search Buffers
noremap <silent> <leader>fb :Buffers<cr>

" youCompleteMe ---------------------------------------

" disable left menu
" let g:ycm_show_diagnostics_ui = 0
" don't show preview when autocompleting
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" ctrl+b go to declaration
" noremap <silent> <C-b> :YcmCompleter GoToDeclaration<cr>

" NERDcommenter ---------------------------------------

" ctrl+k toggle comment for line or selection
nmap <silent> <C-k> <leader>c<space>
vmap <silent> <C-k> <leader>c<space>
" alt+k for pretty comments
nmap <silent> <leader>k <leader>cs
vmap <silent> <leader>k <leader>cs

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1

" vim-multiple-cursors ---------------------------------------

" let g:multi_cursor_select_all_word_key = '<Esc>n'
" let g:multi_cursor_select_all_key      = '<Esc>n'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup OnFileOpen
    autocmd!
    " Return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " Keep all folds open when a file is opened
    autocmd BufReadPost * normal zR
augroup END

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

augroup OnFileWrite
    autocmd!
    " Delete trailing white spaces on save
    " autocmd BufWritePre * :call CleanExtraSpaces()
    autocmd BufWritePre * :silent !mkdir -p %:h
augroup END

augroup OnFocusGain
    autocmd!
    " better autoread
    autocmd WinEnter,BufEnter * :silent! checktime
augroup END

fun! SetRulerHighlights()
    if &filetype == "help"
        setlocal cursorline colorcolumn=
        let g:goyo_width = 79
    elseif &filetype == "gitcommit"
        setlocal cursorline colorcolumn=50,72
        let g:goyo_width = 72
    else
        setlocal cursorline colorcolumn=80,101
        let g:goyo_width = 101
    endif
endfun

augroup Win
    autocmd!
    autocmd WinEnter,BufEnter * :call SetRulerHighlights()
    autocmd WinLeave,BufLeave * setlocal nocursorline colorcolumn=
augroup END

augroup Vim
    autocmd!
    autocmd VimEnter * if &diff | silent! colorscheme gruvbox | endif
augroup END

augroup QuickFix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    cwindow
augroup END

