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

" vim:set sw=2:

" Disables AutoComplPop popup window
AcpLock

" Sets vertical ruler and autowrapping
function! WrapColumn(value)
  let &cc = a:value
  let &textwidth = a:value
  setlocal fo=aw2tq
endfunction

" Sets soft text autowrapping without line breaks
function! SoftWrap()
  let &cc = 0
  let &textwidth=0
  let &wrapmargin=2
  let &columns=78
  set wrap
  set linebreak
  set nolist
  setlocal fo=croql
endfunction

call WrapColumn(80)

nmap <silent><leader>w4 :call WrapColumn(40)<CR>
nmap <silent><leader>w5 :call WrapColumn(50)<CR>
nmap <silent><leader>w6 :call WrapColumn(60)<CR>
nmap <silent><leader>w7 :call WrapColumn(70)<CR>
nmap <silent><leader>w8 :call WrapColumn(80)<CR>
nmap <silent><leader>wm :call WrapColumn(78)<CR>
nmap <silent><leader>wg :call WrapColumn(70)<CR>
nmap <silent><leader>w1 :call SoftWrap()<CR>

nmap <silent><leader>ц4 :call WrapColumn(40)<CR>
nmap <silent><leader>ц5 :call WrapColumn(50)<CR>
nmap <silent><leader>ц6 :call WrapColumn(60)<CR>
nmap <silent><leader>ц7 :call WrapColumn(70)<CR>
nmap <silent><leader>ц8 :call WrapColumn(80)<CR>
nmap <silent><leader>ць :call WrapColumn(78)<CR>
nmap <silent><leader>цп :call WrapColumn(70)<CR>
nmap <silent><leader>ц1 :call SoftWrap()<CR>

" The ULTIMATE paragraph formatter. How to use:
" press <leader>i on the first line of paragraph,
" press <leader>i again on the last line,
" at the end, cursor jums back to the first line.
nmap <leader>i maV
vmap <leader>i :s/\n/ /<CR>o<Esc>kgvgq:noh<CR>`a

nmap <leader>ш maV
vmap <leader>ш :s/\n/ /<CR>o<Esc>kgvgq:noh<CR>`a


" Mappings to go around in autowrapped text with no linebreaks
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

vmap <D-о> gj
vmap <D-л> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-о> gj
nmap <D-л> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Insert current date
nmap <leader>c o# <esc>:r! date<cr>kJo
imap <leader>c <esc>p


" Spell checking
setlocal spell spelllang=ru_yo,en_us
