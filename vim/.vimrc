if filereadable(expand("~/.vimrc.minimal"))
        source ~/.vimrc.minimal
endif

" Make sure we play nicely with fish
if &shell =~# 'fish$'
    set shell=/bin/bash
endif

filetype off
call pathogen#infect()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Powerline
let g:Powerline_symbols = 'fancy'

Bundle "Donearm/Ubaryd"

set background=dark
colorscheme ubaryd

" vundle managing vundle
Bundle 'VundleVim/Vundle.vim'

Bundle 'dockyard/vim-easydir'
Bundle 'junegunn/goyo.vim'
Bundle 'sheerun/vim-polyglot'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'

Bundle 'dag/vim-fish'
Bundle 'chriskempson/base16-vim'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'cohama/lexima.vim'
Bundle 'ervandew/supertab'
Bundle 'junegunn/fzf'

Bundle 'mbbill/undotree'

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'davidhalter/jedi-vim'
Bundle 'junegunn/vim-easy-align'

Bundle 'SirVer/ultisnips'
" ultisnips conf
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plugin 'honza/vim-snippets'

if has('python')
  Bundle "Valloric/MatchTagAlways"
endif

" vim-ariline
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" neocomplete
Bundle 'Shougo/neocomplete.vim'

let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_close_preview = 0

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Disable the preview window
set completeopt-=preview

" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_python_checkers=['pep8']

" indent guides
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

Bundle 'fatih/vim-go'

set t_Co=256
set t_ut=

syntax enable

set pastetoggle=<F2>
" Setting title -> simplier navigation through windows
set title
set ruler

nnoremap <F3> :GundoToggle<CR>
nnoremap <F4> :NERDTreeToggle<CR>

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

nmap <Leader><tab> :call g:AutoCloseJumpAfterPair()<CR>

" Latex config
autocmd BufNewFile,BufRead *.tex set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode
autocmd BufNewFile,BufRead *.tex map <F6> :w<CR>:make %<<CR>:!zathura %<.pdf&<CR>
autocmd BufNewFile,BufRead *.tex set tabstop=4
autocmd BufNewFile,BufRead *.tex set shiftwidth=4
autocmd BufNewFile,BufRead *.tex set softtabstop=4
autocmd BufNewFile,BufRead *.tex set textwidth=79

" Perl
autocmd BufNewFile,BufRead *.pl,*.pm nmap <F6> :!perl %<CR>
autocmd BufNewFile,BufRead *.pl,*.pm set tabstop=4
autocmd BufNewFile,BufRead *.pl,*.pm set shiftwidth=4
autocmd BufNewFile,BufRead *.pl,*.pm set softtabstop=4
autocmd BufNewFile,BufRead *.pl,*.pm set textwidth=79

" Ruby
autocmd BufNewFile,BufRead *.rb set tabstop=2
autocmd BufNewFile,BufRead *.rb set shiftwidth=2
autocmd BufNewFile,BufRead *.rb set softtabstop=2
autocmd BufNewFile,BufRead *.rb set textwidth=79

" rst
autocmd BufNewFile,BufRead *.rst set tabstop=4
autocmd BufNewFile,BufRead *.rst set shiftwidth=4
autocmd BufNewFile,BufRead *.rst set softtabstop=4
autocmd BufNewFile,BufRead *.rst set textwidth=75
autocmd BufNewFile,BufRead *.rst syntax spell toplevel
"autocmd BufNewFile,BufRead *.rst syntax sync fromstart
autocmd BufNewFile,BufRead *.rst setlocal spell


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


" Lua
autocmd BufNewFile,BufRead *.lua map <F6> :w<CR>:!lua %<CR>

" Mail
" Some tricks for mutt
" F1 through F3 re-wraps paragraphs in useful ways
augroup MUTT
  au BufRead ~/.mutt/tmp/mutt* set spell " <-- vim 7 required
  au BufRead ~/.mutt/tmp/mutt* nmap  <F1>  gqap
  au BufRead ~/.mutt/tmp/mutt* nmap  <F2>  gqqj
  au BufRead ~/.mutt/tmp/mutt* nmap  <F3>  kgqj
  au BufRead ~/.mutt/tmp/mutt* map!  <F1>  <ESC>gqapi
  au BufRead ~/.mutt/tmp/mutt* map!  <F2>  <ESC>gqqji
  au BufRead ~/.mutt/tmp/mutt* map!  <F3>  <ESC>kgqji
augroup END

autocmd FileType c,cpp,java,php,pl,py,html,htmldjango,markdown autocmd BufWritePre <buffer> :%s/\s\+$//e

nnoremap <Left> :echo 'use h!'<CR>
nnoremap <Right> :echo 'use l!'<CR>
nnoremap <Up> :echo 'use k!'<CR>
nnoremap <Down> :echo 'use j!'<CR>

if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
endif
