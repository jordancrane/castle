" Jordan Crane's .vimrc

" Start dein {{{
if &compatible
  set nocompatible
endif
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim/
call dein#begin('~/.vim/dein/')
"  }}}

" Plugins {{{
call dein#add('Shougo/unite.vim')
call dein#add('gcmt/wildfire.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/nerdtree')
call dein#add('ryanss/vim-hackernews')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('lifepillar/vim-cheat40')
call dein#add('sjl/gundo.vim')
call dein#add('groenewege/vim-less')
call dein#add('Chiel92/vim-autoformat')
call dein#add('Shougo/neocomplete')

" Appearance {{{
call dein#add('vim-scripts/peaksea')
call dein#add('junegunn/seoul256.vim')
call dein#add('chriskempson/base16-vim')
call dein#add('junegunn/goyo.vim')
call dein#add('amix/vim-zenroom2')
call dein#add('nathanaelkane/vim-indent-guides')
" }}}

" Syntax Highlighters {{{
call dein#add('hdima/python-syntax')
call dein#add('slava/vim-spacebars')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('pangloss/vim-javascript')
call dein#add('kchmck/vim-coffee-script')
call dein#add('leafgarland/typescript-vim')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('JuliaLang/julia-vim')
call dein#add('rust-lang/rust.vim')

" HTML, javascript
call dein#add('jelera/vim-javascript-syntax', { 'autoload': { 'filetypes': ['javascript'] } })
call dein#add('guileen/simple-javascript-indenter', { 'autoload': { 'filetypes': ['javascript'] } })
"  }}}

" Formatters {{{
call dein#add('maksimr/vim-jsbeautify')
call dein#add('editorconfig/editorconfig-vim')
" }}}
" }}}

" Auto Format {{{
noremap <F3> :Autoformat<CR>
" }}}

" You Complete Me {{{
"let g:EditorConfig_exclude_patterns = ['fugitive://.*']
"let g:ycm_python_binary_path = '/usr/bin/python3'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
" }}}

" Appearance {{{
" colorscheme
let base16colorspace=256
colorscheme seoul256

" enable indent guide
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Hax for airline
set noruler
set laststatus=2
"  }}}

" Buffers {{{
" Airline show list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nnoremap <leader>n :enew<CR>

" Move to the next buffer
nnoremap <leader>l :bnext<CR>

" Move to the previous buffer
nnoremap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>
" }}}

" Indentation {{{
set tabstop    =4
set softtabstop=4
set shiftwidth =4
set expandtab
set autoindent
set smartindent
filetype indent on
" }}}

" Movement {{{
" move up and down by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" move to beg/end of line
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
" }}}

" Splits {{{
" navigate vim splits like a sane person
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" more intuitive split opening
set splitbelow
set splitright
"  }}}

" Mappings {{{
" <space> is leader
nnoremap <Space> <Nop>
let mapleader = " "

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" super quick search and replace
nnoremap <leader><Space> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/

" toggle indent Guides
nnoremap <leader>i :IndentGuidesToggle<CR>

" save session
nnoremap <leader>s :mksession<CR>

" highlight last insrted text
nnoremap gV `[v`]

" Ctrl-f is backslash
imap <C-f> <Bslash>

" Map jk to ESC
inoremap jk <ESC>

"  }}}

" UI Settings {{{
set number
set cursorline
set breakindent
set showmatch
syntax on

" Yank/put text via system clipboard
noremap <leader>y "+y
noremap <leader>yy "+Y
noremap <leader>p "+p

"  }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10

" leader a opens/closes fold
nnoremap <leader>a za

" fold based on indent level
set foldmethod=indent
"  }}} 

" Autogroups {{{
  set nocp
  augroup configgroup
    " clears present autocommands
    autocmd!    
    autocmd VimEnter * highlight clear SignColumn
    " Stip whitespace
    "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces() 
    " Syntax folding for c, cpp
    autocmd FileType python setlocal foldmethod=indent      
  augroup END
" }}}

" Functions {{{
" Word Count
function! WC()
  let filename = expand("%")
  let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
  let result = system(cmd)
  echo result . " words"
endfunction

" Backspace sucks
func! Backspace()
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    return "\<Left>\<Del>"
  endif
endfunc

" Strip Tailing Whitespace
"fun! <SID>StripTrailingWhitespaces()
"  let l = line(".")
"  let c = col(".")
"  %s/\s\+$//e
"  call cursor(l, c)
"endfun

inoremap <BS> <c-r>=Backspace()<CR>
inoremap ^h <c-r>=Backspace()<CR>
set backspace=indent,eol,start
"command WC call WC()
"  }}}

" End dein & modeline {{{
" Required:
call dein#end()
set modeline
set modelines=1
" }}}
" vim:foldmethod=marker:foldlevel=0
