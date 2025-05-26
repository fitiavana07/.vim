" SPDX-License-Identifier: Apache-2.0
" Copyright © 2025 Fitiavana Ramanandafy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:    Buffer display configuration
" Last Change:    2025-05-26
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Disable line numbers, so we have more space
set nonumber

" Enable folding, with syntax method by default
" This way, we get a quick overview of the file on open
set foldmethod=syntax

" Folds to the top-level. Per-filetype configuration are set in ftplugin
set foldlevel=0

" Easily locate on which line you are, by highlighting the line
set cursorline

" Keep 2 lines above and below the cursor, so we always have some context.
set scrolloff=2

" Highlight problematic whitespaces
set list listchars=tab:›\ ,trail:•,extends:#,nbsp:.
