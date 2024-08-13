if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

let b:undo_ftplugin = "setlocal expandtab< tabstop< shiftwidth< softtabstop< "
