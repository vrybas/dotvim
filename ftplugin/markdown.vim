" Vim filetype plugin
" Language:		Markdown
" Maintainer:		Tim Pope <vimNOSPAM@tpope.org>

runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

setlocal comments=fb:*,fb:-,fb:+,n:> commentstring=>\ %s
setlocal formatoptions+=tcqln formatoptions-=r formatoptions-=o
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

" Sets vertical ruler and autowrapping
function! WrapColumn(value)
  let &cc = a:value
  let &textwidth = a:value
endfunction

call WrapColumn(80)

" Paragraph Formatting
nmap <leader>i maV
vmap <leader>i :s/\n/ /<CR>o<Esc>kgvgq:noh<CR>`a

nmap <leader>ш maV
vmap <leader>ш :s/\n/ /<CR>o<Esc>kgvgq:noh<CR>`a

" Autoformat paragraph to respect autowrapping after each change
setlocal fo=aw2tq

" Spell checking
setlocal spell spelllang=ru_yo,en_us

" Bigger font
setlocal gfn=Monaco:h14

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setl cms< com< fo< flp<"
else
  let b:undo_ftplugin = "setl cms< com< fo< flp<"
endif

" vim:set sw=2:

