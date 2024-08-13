if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal foldcolumn=5

let b:undo_ftplugin = "setlocal foldcolumn<"
