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

" NeoComplete {{{
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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
"inoremap <expr><C-l>     neocomplete#complete_common_string()

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
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
"let g:neocomplete#sources#omni#input_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl ='\h\w*->\h\w*\|\h\w*::'
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
nnoremap <C-c> <Nop>
nnoremap <C-c> :enew<CR>

" Move to the next buffer
nnoremap <C-n> <Nop>
nnoremap <C-n> :bnext<CR>

" Move to the previous buffer
nnoremap <C-p> <Nop>
nnoremap <C-p> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <C-x> <Nop>
nnoremap <C-x> :bp <BAR> bw #<CR>

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

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

"  }}}

" UI Settings {{{
set number
set cursorline
set breakindent
set showmatch
set hls
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

" Enter toggles hlsearch
let g:highlighting = 0
function! Highlighting()
    if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
        let g:highlighting = 0
        return ":silent nohlsearch\<CR>"
    endif
    let @/ = '\<'.expand('<cword>').'\>'
    let g:highlighting = 1
    return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <leader><CR> Highlighting()

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
