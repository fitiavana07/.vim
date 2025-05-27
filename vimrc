" SPDX-License-Identifier: Apache-2.0
" Copyright © 2025 Fitiavana Ramanandafy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main vimrc file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use SPACE as leader key
let mapleader = " "

" enable file type detection, filetype plugins, and filetype-specific indent
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" On save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically re-read the file when changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer-related configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow switching buffer without saving before switching
set hidden


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specific to gitcommit filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG
                  \ call setpos('.', [0, 1, 1, 0])


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line and Ruler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showcmd        " show (partial) command in the last line of the screen
set laststatus=2   " always show the status line
" a ruler format from spf13-vim
set rulerformat=%30(%=\b%n%y%m%r%w\ %l,%c%V\ %P%)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open new split windows in right and below instead of left and top
set splitright splitbelow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In-buffer Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable incremental search
set incsearch

" Highlight all matches
set hlsearch

" Ignore case on search, unless the pattern contains an upper case character
set ignorecase smartcase

" Don't start again from top after bottom is reached
set nowrapscan


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use ripgrep if it is installed
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  "e.g for excluding     set grepprg=rg\ --vimgrep\ --no-heading\
  "                \ --smart-case\ --glob\ '!.git/'\ --glob\ '!node_modules/*'
else
  set grepprg=grep\ -n\ -i\ -R\ $*\ --exclude-dir=classes\ --exclude-dir=.git\
              \ --exclude-dir=node_modules\ --exclude-dir=target\ .\ /dev/null
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Finding files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow searching files in deep directories using :find and :tabfind
set path=**

" Ignored directories when expanding wildcards
set wildignore+=*.class,*/classes/**,*/node_modules/**,*/.git/*,*/target/**,*/dist/**


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable some shipped plugins that are unused
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_getscriptPlugin = 1
let g:loaded_netrwPlugin = 1
let g:loaded_logiPat = 1
let g:loaded_vimballPlugin = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Larger command history size
set history=500

" enhanced command-line completion
set wildmenu wildoptions=pum

" Always show tab page labels line, so we have consistent display
set showtabline=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviour
"
" - Don't make backup nor swap file. We use git for it
" - Set to auto read when changed externally. See :h checktime
"
" Persistent undo has been disabled because is sometimes very slow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For coc.nvim support
" Don't make backup nor swap file. We use git to do the job
set nobackup nowritebackup noswapfile




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
nnoremap <silent> <Leader>tt gt
tnoremap <silent> <Leader>tt <C-w>gt

nnoremap <silent> <Leader>tp gT
tnoremap <silent> <Leader>tp <C-w>gT

nnoremap <silent> <Leader>tn :tabnew<CR>
tnoremap <silent> <Leader>tn <C-w>:tabnew<CR>


" Terminals, for normal and terminal mode
" <Leader>te    open new term
nnoremap <Leader>tr <C-w>:ter<cr>
tnoremap <Leader>tr <C-w>:ter<cr>


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
nnoremap <Tab> <C-d>
nnoremap <BS> <C-u>


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
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use gruvbox colorscheme with dark mode
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_invert_tabline = 1
autocmd vimenter * ++nested colorscheme gruvbox | set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing - Others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

nnoremap <Leader>gg :G<CR>
nnoremap <Leader>tc <C-w>:ter ++curwin<cr>

nnoremap <Leader>vf :vert sfind<Space>
nnoremap <Leader>sf :sfind<Space>

nnoremap <Leader>tb :tab term<CR>
tnoremap <Leader>tb <C-w>:tab term<CR>

nnoremap <Leader>bb :b<Space>
nnoremap <Leader>g<Space> :G<Space>

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)

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

" Allow to trigger background
function! ToggleBG()
    if &background == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
nnoremap <leader>sb :call ToggleBG()<CR>

packadd coc.nvim

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" For coc.nvim
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gr <Plug>(coc-references)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <Leader>db <Plug>VimspectorBreakpoints
let g:vimspector_enable_mappings = 'HUMAN'
nmap <F1> :CocCommand java.debug.vimspector.start<CR>

nnoremap <Leader>fe :NERDTreeToggle<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Hide 'target' directory in NERDTree by default (e.g. for Rust).
" We can use 'f' (filter) in NERDTree window to show them temporarily.
let NERDTreeIgnore = ['^target$']

let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-go',
      \ 'coc-java',
      \ 'coc-java-debug',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-rust-analyzer',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-solargraph',
      \ ]
