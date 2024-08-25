" This file is intended to be supported from Vimrc-supporting softwares,
" which may include Vim 8, Vim 9, IdeaVim, NeoVim.
" Currently tested with Vim 9.0 and IdeaVim.

" for now: ALE works well for JS/TS/React but slow at fixing with prettier
" it works for linting java without installing an lsp. javalsp seems to not
" work, no hover, no go to def

" the leader key
let mapleader = " "

" enable file type detection, plugin, and indent
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor
"
" - quick file overview on file open
"   - folded with syntax method, for quick file overview
" - encourages short lines
"   - lines not wrapped, for best practice of short lines, highlighted at 80
" - no line number by default
" - use 2 spaces for tabs
" - scroll offset set to 2
" - Go to the last position when reopening a file
" - Automatic indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set foldmethod=syntax
set nowrap textwidth=79 colorcolumn=+1
set cursorline
set scrolloff=2
set scrolljump=3

" Tabs
set expandtab     " use spaces instead of tabs when writing
set tabstop=2     " display tabs as 2 spaces
set shiftwidth=2  " use 2 spaces for auto-indent
set softtabstop=2 " delete indentations by 2 spaces
" TODO what does 'smarttab' do?

set autoindent   " copy the previous line indentation
set smartindent  " smarter indentation, based on {} or keywords like 'if'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviour
"
" - Clear trailing white spaces on save
" - Go to the last position when reopening a file
" - Don't make backup nor swap file. We use git for it
" - Set to auto read when changed externally. See :h checktime
"
" Persistent undo has been disabled because is sometimes very slow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clear trailing white spaces on save
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun
au BufWritePre * :call CleanExtraSpaces()

" Go to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Don't make backup nor swap file. We use git to do the job
set nobackup nowritebackup noswapfile

" Set to auto read when a file is changed from the outside. See :h checktime
set autoread
au FocusGained,BufEnter * silent! checktime

" Allow switching buffer without saving
set hidden

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line and Ruler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showcmd        " show (partial) command in the last line of the screen
set laststatus=2   " always show the status line
" from spf13-vim
set rulerformat=%30(%=\b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitright splitbelow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set incsearch hlsearch
set ignorecase smartcase
set nowrapscan
set grepprg=grep\ -n\ -i\ -R\ $*\ --exclude-dir=classes\ --exclude-dir=.git\ --exclude-dir=node_modules\ --exclude-dir=target\ .\ /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping
"
" - map leader is <space>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Navigation betwen windows, for normal and terminal mode
" <Leader> + hjkl for navigation between windows

nnoremap <Leader>wh <C-w><C-h>
tnoremap <Leader>wh <C-w><C-h>

nnoremap <Leader>wj <C-w><C-j>
tnoremap <Leader>wj <C-w><C-j>

nnoremap <Leader>wk <C-w><C-k>
tnoremap <Leader>wk <C-w><C-k>

nnoremap <Leader>wl <C-w><C-l>
tnoremap <Leader>wl <C-w><C-l>


" Tabs, for normal and terminal mode
" <Leader>tt    next tab
" <Leader>tp    previous tab
" <Leader>tn    create a new tab

nnoremap <silent> <Leader>tt gt
tnoremap <silent> <Leader>tt <C-w>gt

nnoremap <silent> <Leader>tp gT
tnoremap <silent> <Leader>tp <C-w>gT

nnoremap <silent> <Leader>tn :tabnew<CR>
tnoremap <silent> <Leader>tn <C-w>:tabnew<CR>


" Terminals, for normal and terminal mode
" <Leader>te    open new term
nnoremap <Leader>te <C-w>:ter<cr>
tnoremap <Leader>te <C-w>:ter<cr>


" Edit/find a file
" <Leader>fi    :find

nnoremap <Leader>fi :find<Space>


" Find in files
" <Leader>gr    :grep
nnoremap <Leader>gr :grep<Space>


" Split current window
" <Leader>sp    :sp
" <Leader>vs    :vs
nnoremap <Leader>sp :sp<CR>
nnoremap <Leader>vs :vs<CR>


" Scroll
nnoremap <Leader>j <C-d>
nnoremap <Leader>k <C-u>


" Quickfix window
" (:botright forces it to go to bottom and take full width)
" <Leader>co    open QuickFix window
" <Leader>cn    go to next in the list
" <Leader>cp    go to previous in the list
nnoremap <Leader>co :botright copen<CR>
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>


" Others
" <Leader>fw    :w        write buffer to file
" <Leader>bd    :bd       delete buffer
" <Leader>q     :close    close window, don't close last window
" <Leader><BS>  :nohl     clear search

nnoremap <silent> <Leader>fw :w<CR>
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>q :close<CR>
nnoremap <silent> <Leader><BS> :nohl<CR>

" For while editing vimrc
" <Leader>vr      Open vimrc
nnoremap <Leader>vr :botright sp ~/.vim/vimrc<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find file
"
" - :find, :tabfind, :sfind
"   - ignore build files and directories, and .git directory
"   - searches recursively in child directories
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow searching files in deep directories using :find and :tabfind
set path=**

set wildignore+=*.class,*/classes/**,*/node_modules/**,*/.git/*,*/target/**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable some shipped plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_getscriptPlugin = 1
let g:loaded_netrwPlugin = 1
let g:loaded_logiPat = 1
let g:loaded_vimballPlugin = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu wildoptions=pum

" Always show tab page labels
set showtabline=2

let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_invert_tabline = 1
autocmd vimenter * ++nested colorscheme gruvbox | set background=light

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript / Typescript / React support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This is too slow
" let g:ale_fix_on_save = 1

let g:ale_linters = {
      \  'typescriptreact': ['eslint', 'tsserver'],
      \  'typescript': ['eslint', 'tsserver'],
      \}
let g:ale_fixers = {
      \  'typescriptreact': ['eslint', 'prettier'],
      \  'typescript': ['prettier', 'tsserver'],
      \}

let g:ale_completion_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set foldlevel=1
set history=500

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to.
" from spf13vim
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Shell command
" from spf13vim
function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
