autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.txt
      \   set ft=markdown
      "\ if &ft =~# '^\%(conf\|modula2\)$' |
      "\   set ft=markdown |
      "\ else |
      "\   setf markdown |
      "\ endif
