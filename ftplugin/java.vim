" SPDX-License-Identifier: Apache-2.0
" Copyright © 2025 Fitiavana Ramanandafy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language:         java filetype plugin
" Last Change:      2025-05-26
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 foldlevel=1

let b:undo_ftplugin = "setlocal expandtab< tabstop< shiftwidth< softtabstop< foldlevel<"
