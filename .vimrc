syntax on

" TAB versus spaces
function! Tabs()
    set noexpandtab		" Treat TAB as TABS
    set tabstop=4		" TAB is actually 4 spaces
    set shiftwidth=4	" Doing >> on a block whill shift it one tab (based on ts setting above)
    set softtabstop=4   " makes the spaces feel like real tabs
endfunction

" SPACES versus tabs
function! Spaces()
    set expandtab		" Treat TAB as spacesa
    set tabstop=4		" TAB is actually 4 spaces
    set shiftwidth=4	" Doing >> on a block whill shift it one tab (based on ts setting above)
    set softtabstop=4   " makes the spaces feel like real tabs
endfunction

set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden         " Hide buffers when they are abandoned
set hlsearch		" Highlight search matches

"set mouse=a			" Enable mouse usage (all modes) in terminals
set showcmd			" Show (partial) command in status line.
set ruler			" Show line, column, etc. in status line
set number			" Show line numbers
set showmatch		" Show matching brackets/braces/parantheses.
set cinwords=if,else,while,do,for,switch,case	" Which keywords should indent 
set cindent		" indent on cinwords
set fileencodings=utf-8	" UTF-8 encoding
set encoding=utf-8 " UTF-8 encoding
set laststatus=2    " Show info in ruler
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ (%l/%L,%v)\ %p%%
set wildmode=longest,list,full " Let TAB completion behave like bash's
set showtabline=2	" Always show tab line

:call Spaces()      " By default, TABs are treated as spaces

" Leader key (default is \)
let mapleader = "\\"

" tab navigation
:nmap <A-PageUp> :tabprevious<CR>
:nmap <A-PageDown> :tabnext<CR>
:map <A-PageUp> :tabprevious<CR>
:map <A-PageDown> :tabnext<CR>
:imap <A-PageUp> <Esc>:tabprevious<CR>i
:imap <A-PageDown> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
:map <C-x> :tabclose<CR>
:nmap <C-a> :w<CR>
:imap <C-a> <Esc>:w<CR>

" Remove search highlight
nnoremap <leader><space> :noh<cr>

" "sudo" save:
:cmap w!! w !sudo tee % >/dev/null

" buffer navigation
:nnoremap <F2> :buffers<CR>:buffer<Space>

" Split window navigation
:nmap <silent> <A-Up> :wincmd k<CR>
:imap <silent> <A-Up> <Esc>:wincmd k<CR>i
:nmap <silent> <A-Down> :wincmd j<CR>
:imap <silent> <A-Down> <Esc>:wincmd j<CR>i
:nmap <silent> <A-Left> :wincmd h<CR>
:imap <silent> <A-Left> <Esc>:wincmd h<CR>i
:nmap <silent> <A-Right> :wincmd l<CR>
:imap <silent> <A-Right> <Esc>:wincmd l<CR>i
:nmap <silent> <leader><Left> <C-w><
:nmap <silent> <leader><Right> <C-w>>
:nmap <silent> <leader><Up> <C-w>-
:nmap <silent> <leader><Down> <C-w>+
":nmap <silent> <C-Left> <C-w><
":nmap <silent> <C-Right> <C-w>>
":nmap <silent> <C-Up> <C-w>-
":nmap <silent> <C-Down> <C-w>+

" copen/ccl toggle
" toggles the quickfix window.
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . 10
  endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

:inoremap <F4> <Esc>:call QFixToggle(0)<CR>
:nnoremap <F4> :call QFixToggle(0)<CR>

" NERDTree navigation
map <leader>g :NERDTreeToggle<CR>
map <leader>l :NERDTreeFind<CR>
map <leader>r :TlistToggle<CR>

" remove trailing spaces
func! DeleteTrailingWS()
    :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
endfunc
autocmd FileType c,cpp,java,php,py autocmd BufWritePre <buffer> :call DeleteTrailingWS()
autocmd BufWritePre *.py :call DeleteTrailingWS()

" Pathogen
filetype off
call pathogen#infect()
"call pathogen#helptags() "call this when installing new plugins 
filetype plugin on

" themes
set background=dark
set t_Co=256
colorscheme neverland-darker

" NERDTree
:let NERDChristmasTree=1
:let NERDTreeCaseSensitiveSort=1
:let NERDTreeChDirMode=2
:let NERDTreeBookmarksFile = $HOME . "/.vim/NERDTreeBookmarks"
:let NERDTreeShowBookmarks=1
:let NERDTreeShowHidden=1
:let NERDTreeQuitOnOpen=1

" Syntastic
let g:syntastic_auto_loc_list=1 " Auto-open error window if errors are detected
let g:syntastic_enable_signs=1
let g:syntastic_c_check_header=1
let g:syntastic_c_auto_refresh_includes=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" JSLint
let g:JSLintHighlightErrorLine=1

" Localvimrc
let g:localvimrc_ask=0 " No need to ask if .lvimrc should be processed

" CTRLP
let g:ctrlp_working_path_mode=0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Current line highlighting only for current window
"set cursorline
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
"hi Cursorline ctermbg=grey
