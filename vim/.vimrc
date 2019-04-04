if filereadable(expand("~/.vimrc.minimal"))
        source ~/.vimrc.minimal
endif

" Make sure we play nicely with fish
if &shell =~# 'fish$'
    set shell=/bin/bash
endif

" Map more mapleader
let mapleader = "\\"


" Powerline
let g:Powerline_symbols = 'fancy'

" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors
" set t_Co=256
" set t_ut=


call plug#begin('~/.vim/bundle')

Plug 'Donearm/Ubaryd'
Plug 'vim-airline/vim-airline-themes'

set t_Co=256
set t_ut=

" Plugin 'morhetz/gruvbox'
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark = 1

" vundle managing vundle
Plug 'VundleVim/Vundle.vim'

Plug 'dockyard/vim-easydir'
Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['latex']

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'

Plug 'dag/vim-fish'

Plug 'Yggdroot/indentLine'
" Do not conceal Markdown links if not necessary
" https://vi.stackexchange.com/questions/7258/how-do-i-prevent-vim-from-hiding-symbols-in-markdown-and-json#comment23465_7263
let g:indentLine_setConceal = 0

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

Plug 'scrooloose/nerdtree'
let NERDTreeHijackNetrw = 0
noremap <silent> <leader>n :NERDTreeToggle<CR> <C-w>=
noremap <silent> <leader>f :NERDTreeFind<CR> <C-w>=

Plug 'cohama/lexima.vim'

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Display funciton signatures from completions in the command line
Plug 'Shougo/echodoc.vim'
let g:echodoc_enable_at_startup = 1
let g:echodoc#enable_at_startup = 1
set noshowmode

"Deoplete: dark powered autocomplete (in an async way)
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#sources={}

" Only enable `deoplete` once we get into INSERT mode
autocmd InsertEnter * call deoplete#enable()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'mbbill/undotree'
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
nnoremap <F3> :UndotreeToggle<CR>

Plug 'ctrlpvim/ctrlp.vim'

let g:ctrlp_map = '<leader><c-p>'
if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif
" use fd if available
if executable('fd')
    let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
    let g:ctrlp_use_caching = 0
endif

Plug 'gibiansky/vim-latex-objects'
Plug 'lervag/vimtex'
Plug 'vim-scripts/DrawIt'
Plug 'reedes/vim-wordy'

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plug 'godlygeek/tabular'

" Align visual selection around character
Plug 'tommcdo/vim-lion'

"Plug 'SirVer/ultisnips'
"" ultisnips conf
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"
"Plug 'honza/vim-snippets'
" Looks nice but slows down Vim startup noticeably
"Plug 'Valloric/MatchTagAlways'
Plug 'zah/nim.vim'

" vim-ariline
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Disable the preview window
set completeopt-=preview

" lints
if has('nvim') || v:version >= 800
  " Make it so that linter is only called when INSERT mode is left
  let g:ale_lint_on_text_changed = 0
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_insert_leave = 1

  " Calls linter and sytax check
  Plug 'w0rp/ale'
  let g:airline#extensions#ale#enabled = 1
  let g:ale_linters = {
  \ 'python': ['flake8'] ,
  \ }
endif


" indent guides
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

Plug 'fatih/vim-go'
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'lifepillar/vim-mucomplete'

Plug 'editorconfig/editorconfig-vim'

call plug#end()

syntax enable
colorscheme ubaryd
let g:airline_theme='ubaryd'
let python_highlight_all = 1

set pastetoggle=<F2>
" Setting title -> simplier navigation through windows
set title
set ruler


if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

nmap <Leader><tab> :call g:AutoCloseJumpAfterPair()<CR>

" Autoread
set autoread
augroup autoRead
    autocmd!
    autocmd CursorHold * silent! checktime
augroup END

" Latex config
autocmd BufNewFile,BufRead *.tex set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode
autocmd BufNewFile,BufRead *.tex map <F6> :w<CR>:make %<<CR>:!zathura %<.pdf&<CR>
autocmd BufNewFile,BufRead *.tex set tabstop=4
autocmd BufNewFile,BufRead *.tex set shiftwidth=4
autocmd BufNewFile,BufRead *.tex set softtabstop=4
autocmd BufNewFile,BufRead *.tex set textwidth=79

" Perl
autocmd BufNewFile,BufRead *.pl,*.pm set tabstop=4
autocmd BufNewFile,BufRead *.pl,*.pm set shiftwidth=4
autocmd BufNewFile,BufRead *.pl,*.pm set softtabstop=4
autocmd BufNewFile,BufRead *.pl,*.pm set textwidth=79

" Ruby
autocmd BufNewFile,BufRead *.rb set tabstop=2
autocmd BufNewFile,BufRead *.rb set shiftwidth=2
autocmd BufNewFile,BufRead *.rb set softtabstop=2
autocmd BufNewFile,BufRead *.rb set textwidth=79
autocmd FileType ruby,eruby set noballooneval

" rst
autocmd BufNewFile,BufRead *.rst set tabstop=4
autocmd BufNewFile,BufRead *.rst set shiftwidth=4
autocmd BufNewFile,BufRead *.rst set softtabstop=4
autocmd BufNewFile,BufRead *.rst set textwidth=75
autocmd BufNewFile,BufRead *.rst syntax spell toplevel
"autocmd BufNewFile,BufRead *.rst syntax sync fromstart
autocmd BufNewFile,BufRead *.rst setlocal spell
autocmd BufNewFile,BufRead *.rst let b:surround_{char2nr('b')} = "**\r**"
autocmd BufNewFile,BufRead *.rst let b:surround_{char2nr('v')} = "``\r``"


"C config
autocmd BufNewFile,BufRead *.c set makeprg=gcc\ %
autocmd BufNewFile,BufRead *.h set makeprg=gcc\ %
autocmd BufNewFile,BufRead *.c map <F6> :w<CR>:make<CR>:!./a.out<CR>
autocmd BufNewFile,BufRead *.c set tabstop=8
autocmd BufNewFile,BufRead *.c set shiftwidth=8
autocmd BufNewFile,BufRead *.c set softtabstop=8
autocmd BufNewFile,BufRead *.c set textwidth=75
autocmd BufNewFile,BufRead *.c set noexpandtab

"CC conf
autocmd BufNewFile,BufRead *.cpp,*.cc set makeprg=g++\ %
autocmd BufNewFile,BufRead *.h set makeprg=g++\ %
autocmd BufNewFile,BufRead *.cpp,*.cc,*.h map <F6> :w<CR>:make<CR>:!./a.out<CR>
autocmd BufNewFile,BufRead *.cpp,*.cc,*.h set tabstop=4
autocmd BufNewFile,BufRead *.cpp,*.cc,*.h set shiftwidth=4
autocmd BufNewFile,BufRead *.cpp,*.cc,*.h set softtabstop=4

" NXC
autocmd BufNewFile,BufRead *.nxc set filetype=c
autocmd BufNewFile,BufRead *.nxc set tabstop=4
autocmd BufNewFile,BufRead *.nxc set shiftwidth=4
autocmd BufNewFile,BufRead *.nxc set softtabstop=4


" JS
autocmd BufNewFile,BufRead *.js set tabstop=2
autocmd BufNewFile,BufRead *.js set shiftwidth=2
autocmd BufNewFile,BufRead *.js set softtabstop=2
autocmd BufNewFile,BufRead *.js set textwidth=79

" JSON
autocmd BufNewFile,BufRead *.json set tabstop=2
autocmd BufNewFile,BufRead *.json set shiftwidth=2
autocmd BufNewFile,BufRead *.json set softtabstop=2

" Python
autocmd BufNewFile,BufRead *.py set tabstop=4
autocmd BufNewFile,BufRead *.py set shiftwidth=4
autocmd BufNewFile,BufRead *.py set softtabstop=4
autocmd BufNewFile,BufRead *.py set textwidth=79

" Java
autocmd BufNewFile,BufRead *.java set tabstop=4
autocmd BufNewFile,BufRead *.java set shiftwidth=4
autocmd BufNewFile,BufRead *.java set softtabstop=4
autocmd BufNewFile,BufRead *.java set textwidth=79

"Markdown
autocmd BufNewFile,BufRead *.bmd,*.md set filetype=markdown
autocmd BufNewFile,BufRead *.bmd,*.md set textwidth=79

" PDE
autocmd BufNewFile,BufRead *.pde set filetype=c
autocmd BufNewFile,BufRead *.pde set tabstop=2
autocmd BufNewFile,BufRead *.pde set shiftwidth=2
autocmd BufNewFile,BufRead *.pde set softtabstop=2

" HTML
autocmd BufNewFile,BufRead *.tt,*.html,*.htm set tabstop=2
autocmd BufNewFile,BufRead *.tt,*.html,*.htm set shiftwidth=2
autocmd BufNewFile,BufRead *.tt,*.html,*.htm set softtabstop=2
autocmd BufNewFile,BufRead *.tt,*.html,*.htm set filetype=htmldjango

nnoremap <Left> :echo 'use h!'<CR>
nnoremap <Right> :echo 'use l!'<CR>
nnoremap <Up> :echo 'use k!'<CR>
nnoremap <Down> :echo 'use j!'<CR>

if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
endif
