" SPDX-License-Identifier: Apache-2.0
" Copyright © 2025 Fitiavana Ramanandafy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:    json filetype plugin
" Last Change:    2025-05-26
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal foldcolumn=5
setlocal foldlevel=1

let b:undo_ftplugin = "setlocal foldcolumn< foldlevel<"
