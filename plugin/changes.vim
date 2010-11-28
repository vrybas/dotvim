" Changes.vim - Using Signs for indicating changed lines
" ---------------------------------------------------------------
" Version:  0.1
" Authors:  Christian Brabandt <cb@256bit.org>
" Last Change: 2010/04/10
" Script:  <not yet available>
" License: VIM License
" GetLatestVimScripts: <not yet available>

" Configuration:"{{{
" Exit quickly when:
" - this plugin was already loaded
" - when 'compatible' is set

if exists('loaded_changes') || &cp
    finish
endif"}}}

" Documentation:"{{{
" To see differences with your file, exexute:
" :EnableChanges
"
" The following variables will be accepted:
"
" g:changes_hl_lines
" If set, all lines will be highlighted, else
" only an indication will be displayed on the first column
" (default: 0)
"
" g:changes_autocmd
" Updates the indication for changed lines automatically,
" if the user does not press a key for 'updatetime' seconds when
" Vim is not in insert mode. See :h 'updatetime'
" (default: 0)
"
" g:changes_verbose
" Output a short description, what these colors mean
" (default: 1)
"
" Colors for indicating the changes
" By default changes.vim displays deleted lines using the hilighting
" DiffDelete, added lines using DiffAdd and modified lines using
" DiffChange.
" You can see how these are defined, by issuing 
" :hi DiffAdd
" :hi DiffDelete
" :hi DiffChange
" See also the help :h hl-DiffAdd :h hl-DiffChange and :h hl-DiffDelete
"
" If you'd like to change these colors, simply change these hilighting items
" see :h :hi
" "}}}

let loaded_changes = 1

" Check preconditions"{{{
if !has("diff") 
    call <sid>WarningMsg("Diff support not available in your Vim version.")
    call <sid>WarningMsg("changes plugin will not be working!")
    finish
endif

if  !has("signs")
    call <sid>WarningMsg("Sign Support support not available in your Vim version.")
    call <sid>WarningMsg("changes plugin will not be working!")
    finish
endif

if !executable("diff") || executable("diff") == -1
    call <sid>WarningMsg("No diff executable found")
    call <sid>WarningMsg("changes plugin will not be working!")
    finish
endif"}}}

fu! <sid>WarningMsg(msg)"{{{
    echohl WarningMsg
    echo a:msg
    echohl Normal
endfu"}}}

fu! <sid>Output()"{{{
    echohl Title
    echo "Differences will be highlighted like this:"
    echohl Normal
    echo "========================================="
    echohl DiffAdd
    echo "+ Added Lines"
    echohl DiffDelete
    echo "- Deleted Lines"
    echohl DiffChange
    echo "* Changed Lines"
    echohl Normal
endfu"}}}

fu! <sid>Init()"{{{
    let s:hl_lines = (exists("g:changes_hl_lines") ? g:changes_hl_lines : 0)
    let s:autocmd  = (exists("g:changes_autocmd")  ? g:changes_autocmd  : 0)
    let s:verbose  = (exists("g:changes_verbose")  ? g:changes_verbose  : 1)

    let s:signs={}
    let s:ids={}
    let s:signs["add"] = "texthl=DiffAdd text=+ texthl=DiffAdd " . ( (s:hl_lines) ? " linehl=DiffAdd" : "")
    let s:signs["del"] = "texthl=DiffDelete text=- texthl=DiffDelete " . ( (s:hl_lines) ? " linehl=DiffDelete" : "")
    let s:signs["chg"] = "texthl=DiffChange text=* texthl=DiffChange " . ( (s:hl_lines) ? " linehl=DiffDelete" : "")

    let s:ids["add"]   = hlID("DiffAdd")
    let s:ids["del"]   = hlID("DiffDelete")
    let s:ids["ch"]    = hlID("DiffChange")
    call <sid>DefineSigns()
    call <sid>AuCmd(s:autocmd)
endfu"}}}

fu! <sid>AuCmd(arg)"{{{
    if s:autocmd && a:arg
	augroup Changes
		autocmd!
		au CursorHold * :call <sid>GetDiff()
	augroup END
    else
	augroup Changes
		autocmd!
	augroup END
    endif
endfu!"}}}

fu! <sid>DefineSigns()"{{{
    exe "sign define add" s:signs["add"]
    exe "sign define del" s:signs["del"]
    exe "sign define ch"  s:signs["chg"]
endfu"}}}

fu! <sid>GetDiff()"{{{
    call <sid>Init()
    let o_lz=&lz
    let o_fdm=&fdm
    setl lz
    sign unplace *
    call <sid>MakeDiff()
    let b:diffhl={'add': [], 'del': [], 'ch': []}
    let line=1
    while line <= line('$')
	let id=diff_hlID(line,1)
	if  (id == 0)
	    let line+=1
	    continue
	elseif (id == s:ids["add"])
	    let b:diffhl['add'] = b:diffhl['add'] + [ line ]
	else
	    let b:diffhl['ch']  = b:diffhl['ch'] + [ line ]
	endif
	let line+=1
    endw
    " Switch to other buffer and check for deleted lines
    wincmd p
    " For some reason, getbufvar setbufvar do not work, so 
    " we use a temporary script variable here
    let s:temp={'del': []}
    let line=1
    while line <= line('$')
	let id=diff_hlID(line,1)
	if (id == s:ids["add"])
	    let s:temp['del'] = s:temp['del'] + [ line ]
	endif
	let line+=1
    endw
    wincmd p
    let b:diffhl['del'] = s:temp['del']
    call <sid>PlaceSigns(b:diffhl)
    call <sid>DiffOff()
    let &lz=o_lz
    let &fdm=o_fdm
endfu"}}}

fu! <sid>PlaceSigns(dict)"{{{
    for [ id, lines ] in items(a:dict)
	for item in lines
	    exe "sign place " . item . " line=" . item . " name=" . id . " buffer=" . bufnr('')
	endfor
    endfor
endfu"}}}
	    
fu! <sid>MakeDiff()"{{{
    " Get diff for current buffer with original
    vert new
    set bt=nofile
    r #
    0d_
    diffthis
    wincmd p
    diffthis
endfu"}}}

fu! <sid>DiffOff()"{{{
    " Turn off Diff Mode and close buffer
    wincmd p
    diffoff!
    q
endfu"}}}

fu! <sid>CleanUp()"{{{
    sign unplace *
    sign undefine add
    sign undefine del
    sign undefine ch
    call <sid>AuCmd(0)
endfu"}}}

" Define User-Commands and Autocommand "{{{
com! EnableChanges :call <sid>GetDiff()|:call <sid>Output()
com! DisableChanges :call <sid>CleanUp()"}}}

call <sid>Init()

" Modeline
" vi:fdm=marker fdl=0
