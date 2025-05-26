" SPDX-License-Identifier: Apache-2.0
" Copyright © 2025 Fitiavana Ramanandafy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language:         gitcommit filetype plugin
" Last Change:      2025-05-26
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal textwidth=79

let b:undo_ftplugin = "setlocal textwidth<"
