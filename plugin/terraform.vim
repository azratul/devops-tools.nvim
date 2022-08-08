if exists('g:loaded_terraform') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim           " reset them to defaults

" command to run our plugin
command! -complete=file -nargs=1 TerraformInit lua require("terraform").init(<q-args>)
command! -complete=file -nargs=+ TerraformValidate lua require("terraform").validate(<f-args>)
command! -complete=file -nargs=+ TerraformPlan lua require("terraform").plan(<f-args>)
command! -complete=file -nargs=+ TerraformApply lua require("terraform").apply(<f-args>)
command! -complete=file -nargs=+ TerraformDestroy lua require("terraform").destroy(<f-args>)

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_terraform = 1
