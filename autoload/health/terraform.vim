function! health#terraform#check()
    if !has('nvim-0.5')
        call health#report_warn("please install nvim > 0.5")
    else
        call health#report_ok("nvim 0.5 installed")
    endif

    if !executable('terraform')
        call health#report_error("please install terraform")
    else
        call health#report_ok("terraform installed")
    endif
endfunction
