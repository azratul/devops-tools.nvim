function! health#helm#check()
    if !has('nvim-0.5')
        call health#report_warn("please install nvim > 0.5")
    else
        call health#report_ok("nvim 0.5 installed")
    endif

    if !executable('helm')
        call health#report_error("please install helm")
    else
        call health#report_ok("helm installed")
    endif
endfunction
