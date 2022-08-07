function! health#docker#check()
    if !has('nvim-0.5')
        call health#report_warn("please install nvim > 0.5")
    else
        call health#report_ok("nvim 0.5 installed")
    endif

    if !executable('docker')
        call health#report_error("please install docker")
    else
        call health#report_ok("docker installed")
    endif

    if !executable('docker-compose')
        call health#report_warn("please install docker-compose")
    else
        call health#report_ok("docker-compose installed")
    endif
endfunction
