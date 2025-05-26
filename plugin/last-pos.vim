" SPDX-License-Identifier: Apache-2.0
" Copyright © 2025 Fitiavana Ramanandafy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description: Remember last position in file
" Last Change:  2025-05-26
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Go to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                  \ | exe "normal! g'\"" | endif
