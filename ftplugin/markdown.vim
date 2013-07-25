" Vim filetype plugin
" Language:		Markdown
" Maintainer:		Tim Pope <vimNOSPAM@tpope.org>

runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

setlocal comments=fb:*,fb:-,fb:+,n:> commentstring=>\ %s
setlocal formatoptions+=tcqln formatoptions-=r formatoptions-=o
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setl cms< com< fo< flp<"
else
  let b:undo_ftplugin = "setl cms< com< fo< flp<"
endif

" Sets vertical ruler and autowrapping
function! WrapColumn(value)
  execute "setlocal colorcolumn=" . join(range(a:value+1,335), ',')
  let &textwidth = a:value
  setlocal fo=aw2tq
endfunction

call WrapColumn(80)

nmap <silent><leader>w4 :call WrapColumn(40)<CR>
nmap <silent><leader>w5 :call WrapColumn(50)<CR>
nmap <silent><leader>w6 :call WrapColumn(60)<CR>
nmap <silent><leader>w7 :call WrapColumn(70)<CR>
nmap <silent><leader>w8 :call WrapColumn(80)<CR>
nmap <silent><leader>wm :call WrapColumn(78)<CR>
nmap <silent><leader>wg :call WrapColumn(72)<CR>

nmap <silent><leader>ц4 :call WrapColumn(40)<CR>
nmap <silent><leader>ц5 :call WrapColumn(50)<CR>
nmap <silent><leader>ц6 :call WrapColumn(60)<CR>
nmap <silent><leader>ц7 :call WrapColumn(70)<CR>
nmap <silent><leader>ц8 :call WrapColumn(80)<CR>
nmap <silent><leader>ць :call WrapColumn(78)<CR>
nmap <silent><leader>цп :call WrapColumn(72)<CR>

" The ULTIMATE paragraph formatter. How to use:
" press <leader>i on the first line of paragraph,
" press <leader>i again on the last line,
" at the end, cursor jums back to the first line.
nmap <leader>i maV
vmap <leader>i :s/\n/ /<CR>o<Esc>kgvgq:noh<CR>`a

nmap <leader>ш maV
vmap <leader>ш :s/\n/ /<CR>o<Esc>kgvgq:noh<CR>`a

"""" Remove linebreaks and double spaces from selected text, copy to clipboard
vmap <silent><leader>y :s/\n\\|\s\+/ /<cr>V:s/^\s\+\\|\s\+$//<cr>:s/\n\\|\s\+/ /<cr>0vg_y,m
vmap <silent><leader>н :s/\n\\|\s\+/ /<cr>V:s/^\s\+\\|\s\+$//<cr>:s/\n\\|\s\+/ /<cr>0vg_y,m
"---

"""" Remove linebreaks and double spaces from selected text and cut to clipboard
vmap <silent><leader>d :s/\n\\|\s\+/ /<cr>V:s/^\s\+\\|\s\+$//<cr>:s/\n\\|\s\+/ /<cr>0vg_d,m
vmap <silent><leader>в :s/\n\\|\s\+/ /<cr>V:s/^\s\+\\|\s\+$//<cr>:s/\n\\|\s\+/ /<cr>0vg_d,m

"""" Remove linebreaks and double spaces from tex above and cut to clipboard
nmap <silent><leader>d o<esc>Vgg,d,m
nmap <silent><leader>в o<esc>Vgg,d,m
"---

" Complete a task
nmap T VT
vmap T :s/\[ \]/[x]/<cr>:noh<cr>


" Spell checking
setlocal spell spelllang=ru_yo,en_us




