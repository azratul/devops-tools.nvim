if exists('g:loaded_kubectl') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim           " reset them to defaults

" command to run our plugin
command! -nargs=+ KubectlGet lua require("kubectl").get(<q-args>)
command! -nargs=+ KubectlDescribe lua require("kubectl").describe(<q-args>)
command! -nargs=0 KubectlLogs lua require("kubectl").logs()
command! -nargs=0 KubectlDecode lua require("kubectl").decode()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_kubectl = 1
