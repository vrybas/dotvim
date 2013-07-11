"*****************************************************************************"
"
" Vundle configuration
" https://github.com/gmarik/vundle
"
"*****************************************************************************"
 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 " Bundles :
 "
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'tpope/vim-rails'
 Bundle 'danchoi/ri.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'mileszs/ack.vim'
 Bundle 'vim-scripts/bufexplorer.zip'
 Bundle 'vim-scripts/delimitMate.vim'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'tpope/vim-fugitive'
 Bundle 'sjl/gundo.vim'
 Bundle 'tsaleh/vim-matchit'
 Bundle 'cfurrow/vim-l9'
 Bundle 'ervandew/supertab'
 Bundle 'duff/vim-scratch'
 Bundle 'tpope/vim-surround'
 Bundle 'vim-scripts/ZoomWin'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'gorkunov/smartpairs.vim'
 Bundle 'mattn/webapi-vim'
 Bundle 'mattn/gist-vim'
 Bundle 'tomtom/checksyntax_vim'
 Bundle 'airblade/vim-gitgutter'
 Bundle 'skwp/vim-rspec.git'
 Bundle 'kien/ctrlp.vim.git'
 Bundle 'tpope/vim-bundler.git'
 Bundle 'tpope/vim-rake.git'
 Bundle 'tpope/vim-rbenv.git'
 Bundle 'christoomey/vim-tmux-navigator'
 Bundle 'Shougo/neocomplcache.vim.git'
 Bundle 'vrybas/vim-snippets'
 Bundle "MarcWeber/vim-addon-mw-utils"
 Bundle "tomtom/tlib_vim"
 Bundle "garbas/vim-snipmate"
 Bundle 'Shougo/neosnippet'
 Bundle 'jtratner/vim-flavored-markdown'
 Bundle 'bling/vim-bufferline'
 Bundle 'bling/vim-airline'


 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

"*****************************************************************************"
"
" Base settings
"
"*****************************************************************************"

syntax on
" Turn on syntax highlight

set backup
" Enable backup file creation

set backupdir=~/.vim/backups
" Where backups will go

set directory=~/.vim/tmp
" Where temporary files will go


set history=1000
" Remember lots of :cmdline history

set backspace=indent,eol,start
" Allow to navigate from start of line to end of previous line

set wildmode=list:longest
" Make cmdline tab completion similar to bash

set autoread
" Reload file immediately when changed outside of Vim

set encoding=utf-8
" UTF8 Support

set gdefault
" 'g' flag is used by default in commands

set shell=/bin/bash
let $PATH=$HOME.'/.rbenv/shims:'.$PATH

set clipboard=unnamed

set timeoutlen=500 ttimeoutlen=0

set foldmethod=indent
set foldlevel=1



"*****************************************************************************"
"
" Look and feel
"
"*****************************************************************************"

set nu
" Turn on line numbers

set scrolloff=3
" Show 3 line after and before cursor when scrolling

set ts=2
" Tabulation Size

set expandtab
" Tabulation symbols replaced with spaces

set sw=2
" N characters text is moved with 'shift' command

set nowrap
" Disable text wrapping


set shiftwidth=2
" Make indent level equal 2 spaces

set ai
" Auto indent to current level

set si
" Smart indent

set stal=2
" Always show tabs

set hidden
" Allow dirty unsaved buffers

set noswapfile
" Disable .swp files creation for every buffer


set ignorecase
" Disable case-sensitive search when search in lowercase

set smartcase
" Disable case-sensitive search when search in lowercase

set incsearch
" Find the next match as we type the search

set hlsearch
" Hilight searches by default


set showcmd
" Show currently running cmds on cmdline

set showmode
" Show INSERT mode on cmdline


set showmatch
" Jump to automatically inserted paired bracket


set nostartofline
" Don't jump to start of the line when moving around

set vb
" Disable beeping and use 'visualbell' instead

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set foldtext=FoldText()
function! FoldText()
  let l:lpadding = &fdc
  redir => l:signs
  execute 'silent sign place buffer='.bufnr('%')
  redir End
  let l:lpadding += l:signs =~ 'id=' ? 2 : 0

  if exists("+relativenumber")
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
    elseif (&relativenumber)
      let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
    endif
  else
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
    endif
  endif

  " expand tabs
  let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

  let l:info = ' (' . (v:foldend - v:foldstart) . ')'
  let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
  let l:width = winwidth(0) - l:lpadding - l:infolen

  let l:separator = ' … '
  let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
  let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
  let l:text = l:start . ' … '

  set fillchars+=fold:░
  return l:text . repeat(' ', 82 - strlen(l:text))
endfunction

function! ToggleFold()
  if &foldmethod == 'manual'
    let &l:foldmethod = 'indent'
  else
    let &l:foldmethod = 'manual'
  endif
  echo 'foldmethod is now ' . &l:foldmethod
endfunction

"*****************************************************************************"
"
" GUI settings
"
"*****************************************************************************"


if has("gui_running") " =======================================================
  set guioptions-=m
  " Remove menu bar

  set guioptions-=T
  " Remove toolbar

  set guioptions-=r
  " Remove right-hand scroll bar

  set guioptions-=L
  " Remove left-hand scroll bar

  set showtabline=2
  " Show tabs bar

  set laststatus=2
  " Show file status

  set background=light

  colorscheme solarized
  " My favorite color scheme

  set gfn=Monaco:h14
  " Font settings

  au FocusLost * silent! call Save()

endif " =======================================================================


"*****************************************************************************"
"
" Functions and commands
"
"*****************************************************************************"

function! BgSwitch(bg)
  if a:bg == 'light'
    set background=light
  else
    set background=dark
  endif

  let g:solarized_termtrans = 1
  let g:solarized_termcolors = 16
  let g:solarized_visibility = "high"
  let g:solarized_contrast = "high"
  colorscheme solarized

  " Highlights used by the GitGutter signs.
  highlight clear SignColumn
  hi! link SignColumn Background
  highlight GitGutterAdd          guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
  highlight GitGutterChange       guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
  highlight GitGutterDelete       guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE
  highlight default link GitGutterChangeDelete GitGutterChange

  " EasyMotion colors reset
  hi link EasyMotionTarget ErrorMsg
  hi link EasyMotionShade  Comment

  " Folds colors
  highlight clear Folded
  highlight Folded ctermfg=246
  highlight ColorColumn ctermbg=7

  " Colorcolumn settings
    execute "set colorcolumn=" . join(range(81,335), ',')
endfunction


" Sudo promt with :w!!
cmap w!! %!sudo tee > /dev/null %


" Remove all spaces from the end of each line
"
fun! RemoveSpaces()
  if &bin | return | endif
  if search('\s\+$', 'n')
    let line = line('.')
    let col = col('.')
    sil %s/\s\+$//ge
    call cursor(line, col)
  endif
endf



" Toggle relative and straight line numbers
"
function! ToggleRelNumber()
  if (&relativenumber == 1)
    set nu!
  else
    set relativenumber!
  endif
endfunction


" Saves current buffer if it was modified. Updates git diff
"
function! Save()
    call RemoveSpaces()
    execute 'w!'
    execute 'mkview'
    execute 'GitGutter'
endfunction


" Show the difference between unsaved buffer and corresponding file.
"
function! DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction


"*****************************************************************************"
"
" Key mappings
"
"*****************************************************************************"

let mapleader = ","
" Leader key mapping

nnoremap <Space> :call Save()<CR>

nmap <leader>h :bprev<CR>
" Pevious buffer

nmap <leader>l :bnext<CR>
" Next buffer

map <leader><leader>b :BufExplorer<CR>
" Buffer Explorer


set pastetoggle=<F6>
" Do not autoindent lines, when paste from OS buffer

nmap <leader><leader>t :sp<cr><C-w>T
" Open current buffer in new tab


" Open Tabs by number
"
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Go to previous/next tab
"
nmap <leader><leader>h :tabp<cr>
nmap <leader><leader>l :tabn<cr>

nnoremap <silent><Leader>g <C-w><C-]><C-w>T
" Open class/function definition in new tab



" Move visually selected blocks of text
"
vmap <leader>fh <gv
" Left

vmap <leader>fl >gv
" Right

vmap <leader>fk :m'<-2<CR>gv=`>my`<mzgv`yo`z
" Up

vmap <leader>fj :m'>+<CR>gv=`<my`>mzgv`yo`z

" Splits mappings
"
nmap <silent><leader>v <C-w>v<C-w>l
" Create vertical split

nmap <silent><leader>s <C-w>s<C-w>j
" Create horisontal split

nmap <silent><leader>x <C-w>c
" Close split
"
nmap <silent><leader><leader>x :bd<cr>
" Close window and delete buffer

nmap <silent><leader>o :ZoomWin<CR>
" Expand current split to fullscren/restore split size

" Resize splits
nnoremap <silent><leader>J :resize +5<cr>
nnoremap <silent><leader>K :resize -5<cr>
nnoremap <silent><leader>L :vertical resize +5<cr>
nnoremap <silent><leader>H :vertical resize -5<cr>

" Navigate between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>




" Use <Tab> to move between brackets
"
nnoremap <tab> %
vnoremap <tab> %
map <tab> %


nnoremap <leader>a :Ack<space>
" Search with Ack

set listchars=tab:>-,trail:·,eol:$
nmap <silent><leader>y :set nolist!<CR>
" Show trailing characters

nnoremap <leader>m :noh<CR>
" Clear highlight

nmap <silent><leader><tab> :Sscratch<CR>
" Opens a buffer which is never saved (for scratches)

nmap <silent><leader>r :call ToggleRelNumber()<cr>
" Toggle relative and straight line numbers

nmap <Leader>d V<tab>zf
vnoremap <Leader>d zf

vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`<
" Fold everything, except visually selected block

nnoremap <Leader>za :loadview<cr>
" Restore folds

nmap <silent><Leader>zs <Esc>zRzz
" Unfold everything

nmap <silent><leader>bd :call BgSwitch('dark')<CR>
nmap <silent><leader>bl :call BgSwitch('light')<CR>


nmap <silent><leader><leader>i :CheckSyntax<CR>

nmap <leader>zz :call ToggleFold()<CR>

" fugitive shortcuts
noremap <leader>gb :Gblame<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gd :Gdiff<CR>

nnoremap ; :
" Handy mapping for quick access to CLI
"*****************************************************************************"
"
" Plugin configurations
"
"*****************************************************************************"

" NerdTree tree expand behaviour fix (locate and highlight current file)
"
fun! NERDTreeToggleWithFind()
  NERDTreeToggle
  exe "normal \<c-w>l"
  if bufwinnr(t:NERDTreeBufName) > 0
    NERDTreeFind
  end
endf

""" NERDTree
let NERDTreeShowHidden=1
nmap <silent> <c-d> :call NERDTreeToggleWithFind()<CR>

imap <silent> <c-d> :call NERDTreeToggleWithFind()<CR>

"PeepOpen"
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-/> <Plug>PeepOpen
end

""" Vim-Ruby
let ruby_no_expensive = 1
let g:rails_ctags_arguments='--exclude=.rsync*'

" Use Ack instead of Grep
set grepprg=ack\ -a

" Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Easymotion
let g:EasyMotion_leader_key = '<leader>'

"ri.vim
nnoremap  RI :call ri#OpenSearchPrompt(0)<cr> " horizontal split
nnoremap  RIV :call ri#OpenSearchPrompt(1)<cr> " vertical split
nnoremap  RK :call ri#LookupNameUnderCursor()<cr> " keyword lookup "

" Apidock
function! OpenRailsDoc(keyword)
  let url = 'http://apidock.com/rails/'.a:keyword
  call system("open -a Firefox ". url)
endfunction

function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  call system("open -a Firefox ". url)
endfunction

function! OpenRspecDoc(keyword)
  let url = 'http://apidock.com/rspec/'.a:keyword
  call system("open -a Firefox ". url)
endfunction

noremap RR :call OpenRailsDoc(expand('<cword>'))<cr>
noremap RB :call OpenRubyDoc(expand('<cword>'))<cr>
noremap RS :call OpenRspecDoc(expand('<cword>'))<cr>

" Gist.vim
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" GitGutter.vim
let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk
let @d =":e! .git/diff.diff\nggdG:r !git diff\n:w!\n"
let @c =":e! .git/diff.diff\nggdG:r !git diff --cached\n:w!\n"

" Rspec.vim
let g:RspecSplitHorizontal=1
nmap <leader><leader>r :RunSpecLine<cr>
nmap <leader><leader>rr :RunSpec<cr>
nmap <leader><leader>R :RunSpecs<cr>

" CtrlP.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_regexp = 0
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_tabpage_position = 'al'
let g:ctrlp_custom_ignore = '\v[\/]doc[\/]|\.(git|rsync_cache|idea|)$'

"""" Vim Airline
set laststatus=2
let g:airline_theme='solarized'
let g:airline#themes#solarized#inactive = { 'mode': [ '#000000' , '#000000' , 0 , 0, '' ] }
set noshowmode

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_paste_symbol = '∥'"

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%3l:%3c'
"let g:airline_section_z = '%t'

"---

" Vim Bufferline
let g:bufferline_echo=0

" CODE COMPLETION BLOCK

set completeopt+=longest,menu,preview

" For code completion with a drop down menu
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-]>"
let g:SuperTabCompletionContexts = ['s:ContextDiscover','s:ContextText' ]
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-p>"]

let g:SuperTabCrMapping = 1

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_max_list = 300
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_auto_completion_start_length = 5
let g:neocomplcache_fuzzy_completion_start_length = 5

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

set ofu=syntaxcomplete#Complete

 "                                                                           "
"*****************************************************************************"
"
" Auto commands
"
"*****************************************************************************"
 "                                                                           "
 "

autocmd BufEnter * if &filetype == "" | set ft=ruby | endif
" Set filetype to 'ruby' by default to have syntax highlight everywhere
"


" Switching clolorscheme events
"
au VimEnter * silent! call BgSwitch('light')

"Restore custor position on file open
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Highlight line in insert mode
au InsertEnter,InsertLeave * set cul!

"""" Delete hidden Fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
"---


" Check if file was edited outside of Vim
au InsertEnter,InsertLeave,CursorHold,BufEnter * checktime
                                                                             "
"*****************************************************************************"
"
" Map cyrillic keys to latin to use in command mode
"
"*****************************************************************************"
 "                                                                           "

map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map пп gg
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map бб ,,
map ю .
"map . /

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
"map , ?

" Repeat all leader mappings with Cyrillic keys:
"

nmap <leader><leader>е :sp<cr><C-w>T
nmap <silent><leader>м <C-w>v
nmap <silent><leader>ы <C-w>s
nmap <silent><leader>ч <C-w>c
nnoremap <space>д <C-w>l
nnoremap <space>р <C-w>h
nnoremap <space>л <C-w>k
nnoremap <space>о <C-w>j
nmap <silent><leader>щ :ZoomWin<CR>
nnoremap <leader>ф :Ack<space>
nmap <silent><leader>н :set nolist!<CR>
nnoremap <leader>ь :noh<CR>
nmap <silent><leader>к :call ToggleRelNumber()<cr>
vnoremap <Leader>яф <Esc>`<kzfgg`>jzfG`<
nmap <silent><Leader>яы <Esc>zRzz
nmap <silent><leader>ив :set background=dark<CR>
nmap <silent><leader>ид :set background=light<CR>
nnoremap <Leader>г :GundoToggle<CR>

"*****************************************************************************"
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
"* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
"*****************************************************************************"
 "                                                                           "
