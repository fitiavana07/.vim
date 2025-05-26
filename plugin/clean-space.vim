" SPDX-License-Identifier: Apache-2.0
" Copyright © 2025 Fitiavana Ramanandafy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:  Clear trailing whitespace on save
" Last Change:  2025-05-26
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

