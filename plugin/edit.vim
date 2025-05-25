" SPDX-License-Identifier: Apache-2.0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor edit mode configuration
"
" Copyright © 2025 Fitiavana Ramanandafy. All Rights Reserved.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use 2 spaces for tabs and indentations
set expandtab     " use spaces instead of tabs when writing
set tabstop=2     " display tabs as 2 spaces
set shiftwidth=2  " use 2 spaces for auto-indent
set softtabstop=2 " delete indentations by 2 spaces
" TODO what does 'smarttab' do?

" Encourages writing line shorter than 80 characters by:
" - breaking line automatically after 79th character
" - highlight a column to indicate line limit
" - disabling text wrap on display so text wider than the screen is hidden
set textwidth=79 colorcolumn=+1 nowrap

" Automatic indentation
set autoindent   " copy the previous line indentation
set smartindent  " smarter indentation, based on {} or keywords like 'if'
