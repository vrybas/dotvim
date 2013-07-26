" Get last commit message
noremap <leader>gm O<esc>:r !git --no-pager log -1 --pretty=\%s<cr>kdd

call WrapColumn(72)

nmap <silent><leader>wm :call WrapColumn(50)<CR>
nmap <silent><leader>wc :call WrapColumn(72)<CR>

" Spell checking
setlocal spell spelllang=en_us




