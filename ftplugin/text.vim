" Disables AutoComplPop popup window
AcpLock

" Sets vertical ruler and autowrapping
function! WrapColumn(value)
  let &cc = a:value
  let &textwidth = a:value
endfunction

call WrapColumn(80)

nmap <silent><leader>w4 :call WrapColumn(40)<CR>
nmap <silent><leader>w5 :call WrapColumn(50)<CR>
nmap <silent><leader>w6 :call WrapColumn(60)<CR>
nmap <silent><leader>w7 :call WrapColumn(70)<CR>
nmap <silent><leader>w8 :call WrapColumn(80)<CR>
nmap <silent><leader>wm :call WrapColumn(78)<CR>
nmap <silent><leader>wg :call WrapColumn(70)<CR>

nmap <silent><leader>ц4 :call WrapColumn(40)<CR>
nmap <silent><leader>ц5 :call WrapColumn(50)<CR>
nmap <silent><leader>ц6 :call WrapColumn(60)<CR>
nmap <silent><leader>ц7 :call WrapColumn(70)<CR>
nmap <silent><leader>ц8 :call WrapColumn(80)<CR>
nmap <silent><leader>ць :call WrapColumn(78)<CR>
nmap <silent><leader>цп :call WrapColumn(70)<CR>

nmap <leader>i maV
vmap <leader>i :s/\n/ /<CR>o<Esc>kgvgq:noh<CR>`a

nmap <leader>ш maV
vmap <leader>ш :s/\n/ /<CR>o<Esc>kgvgq:noh<CR>`a

" Autoformat paragraph to respect autowrapping after each change
setlocal fo=aw2tq

" Syntax checking
setlocal spell spelllang=ru_yo,en_us
