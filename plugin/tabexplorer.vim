let g:TabExplorer = {}

func! StoreBufTab()
    if !has_key(g:TabExplorer, tabpagenr())
        let  g:TabExplorer[tabpagenr()] = []
    endif

    if index(g:TabExplorer[tabpagenr()], bufname("%")) == -1 && bufname("%") != ""
        call add (g:TabExplorer[tabpagenr()],bufname("%"))
    endif
endfunc

func! DisplayTabExplorer()
    4split
    enew
    call append(".",g:TabExplorer[tabpagenr()])
endfunc

au BufEnter * call StoreBufTab()

command! TabExplorer call DisplayTabExplorer()
