if exists('g:loaded_docker') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim           " reset them to defaults

" command to run our plugin
command! -complete=file -nargs=+ DockerBuild lua require("docker").build(<f-args>)
command! -nargs=* DockerRunD lua require("docker").run_d(<q-args>)
command! -nargs=* DockerRun lua require("docker").run(<q-args>)
command! -nargs=* DockerExec lua require("docker").exec(<q-args>)
command! -nargs=1 DockerPush lua require("docker").push(<args>)
command! -nargs=1 DockerPull lua require("docker").pull(<args>)
command! -nargs=1 DockerLogs lua require("docker").logs(<args>)
command! -nargs=* DockerComposeUp lua require("docker").up(<q-args>)
command! -nargs=0 DockerComposeDown lua require("docker").down()
command! -nargs=0 DockerComposeLogs lua require("docker").logsCompose()
command! -nargs=0 DockerPs lua require("docker").ps()
command! -nargs=0 DockerImages lua require("docker").images()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_docker = 1
