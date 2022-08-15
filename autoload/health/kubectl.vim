function! health#kubectl#check()
    if !has('nvim-0.5')
        call health#report_warn("please install nvim > 0.5")
    else
        call health#report_ok("nvim 0.5 installed")
    endif

    if !executable('fzf')
        call health#report_error("please install Fuzzy Finder(fzf)")
    else
        call health#report_ok("Fuzzy Finder installed")
    endif

    if !executable('kubectl')
        call health#report_error("please install kubectl")
    else
        call health#report_ok("kubectl installed")
    endif
endfunction
