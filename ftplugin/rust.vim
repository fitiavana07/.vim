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

setlocal textwidth=79 colorcolumn=+1 nowrap
setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

let b:undo_ftplugin = "setlocal textwidth< colorcolumn< wrap< " .
                    \ "expandtab< tabstop< shiftwidth< softtabstop<"
