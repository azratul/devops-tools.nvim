if exists('g:loaded_helm') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim           " reset them to defaults

" command to run our plugin
command! -nargs=1 HelmCreate lua require("helm").create(<q-args>)
command! -nargs=1 HelmUninstall lua require("helm").uninstall(<q-args>)
command! -nargs=1 HelmHistory lua require("helm").history(<q-args>)
command! -complete=file -nargs=+ HelmTemplate lua require("helm").template(<q-args>)
command! -complete=file -nargs=+ HelmUpgrade lua require("helm").upgrade(<f-args>)
command! -complete=file -nargs=+ HelmInstall lua require("helm").install(<f-args>)

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_helm = 1
