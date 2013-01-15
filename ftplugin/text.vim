" Disables AutoComplPop popup window
AcpLock

" Sets vertical ruler and autowrapping
function! WrapColumn(value)
  let &cc = a:value
  let &textwidth = a:value
endfunction

call WrapColumn(70)

nmap <silent><leader>c4 :call WrapColumn(40)<CR>
nmap <silent><leader>c5 :call WrapColumn(50)<CR>
nmap <silent><leader>c6 :call WrapColumn(60)<CR>
nmap <silent><leader>c7 :call WrapColumn(70)<CR>
nmap <silent><leader>c8 :call WrapColumn(80)<CR>

" Autoformat paragraph to respect autowrapping after each change
setlocal fo=aw2tq
