if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal textwidth=79

let b:undo_ftplugin = "setlocal textwidth<"
