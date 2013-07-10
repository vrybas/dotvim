autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
      \   set ft=markdown
      "\ if &ft =~# '^\%(conf\|modula2\)$' |
      "\   set ft=markdown |
      "\ else |
      "\   setf markdown |
      "\ endif
