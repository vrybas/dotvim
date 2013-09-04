" Get last commit message
noremap <buffer> <leader>gm O<esc>:r !git --no-pager log -1 --pretty=\%s<cr>kdd
noremap <buffer> <leader>go O<esc>:r !git --no-pager log -15 --pretty=\%s<cr>kdd

" Create commit with entered message, close diff, close current tab
noremap <buffer> <leader><leader>c :wq<cr>:bd diff.diff<cr>:tabclose<cr><cr>
"---
"
" Undo commit creation, close diff, close current tab
noremap <buffer> <leader>u :q!<cr>:bd diff.diff<cr>:tabclose<cr>
"---

call WrapColumn(72)

nmap <buffer><silent><leader>wm :call WrapColumn(50)<CR>
nmap <buffer><silent><leader>wc :call WrapColumn(72)<CR>

" Spell checking
setlocal spell spelllang=en_us




