" SPDX-License-Identifier: Apache-2.0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remember last position in file
"
" Copyright © 2025 Fitiavana Ramanandafy. All Rights Reserved.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Go to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                  \ | exe "normal! g'\"" | endif
