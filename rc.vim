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
 "Bundle 'danchoi/ri.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'mileszs/ack.vim'
 Bundle 'vim-scripts/bufexplorer.zip'
 Bundle 'vim-scripts/delimitMate.vim'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'tpope/vim-fugitive'
 Bundle 'vrybas/vim-flayouts'
 Bundle 'sjl/gundo.vim'
 "Bundle 'cfurrow/vim-l9'
 "Bundle 'duff/vim-scratch'
 Bundle 'tpope/vim-surround'
 Bundle 'vim-scripts/ZoomWin'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'gorkunov/smartpairs.vim'
 "Bundle 'mattn/webapi-vim'
 "Bundle 'mattn/gist-vim'
 "Bundle 'tomtom/checksyntax_vim'
 Bundle 'scrooloose/syntastic'
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
 "Bundle 'duff/vim-bufonly'
 Bundle 'yegappan/mru'
 "Bundle 'int3/vim-extradite'
 Bundle 'tpope/vim-vinegar'
 Bundle 'tpope/vim-eunuch'
 "Bundle 't9md/vim-choosewin'
 Bundle 'vrybas/vim-flog'
 Bundle 'rainerborene/vim-reek'
 Bundle 'airblade/vim-gitgutter'

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
let $PATH=$HOME.'/.dotfiles/bin:'.$PATH

set clipboard=unnamed

set foldmethod=manual

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

set laststatus=2
" Always show statusline

set statusline=%f\ %=%{fugitive#statusline()}%(\ %c%)

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

  highlight SignLowComplexity     guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
  highlight SignMediumComplexity  guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
  highlight SignHighComplexity    guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE
  highlight default link GitGutterChangeDelete GitGutterChange

  " EasyMotion colors reset
  hi link EasyMotionTarget ErrorMsg
  hi link EasyMotionShade  Comment

  " Folds colors
  highlight clear Folded
  highlight Folded ctermfg=246
  highlight ColorColumn ctermbg=0

  " Colorcolumn settings
    execute "set colorcolumn=" . join(range(81,82), ',')
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

" Sets vertical ruler and autowrapping
function! WrapColumn(value)
  execute "setlocal colorcolumn=" . join(range(a:value+1,335), ',')
  let &textwidth = a:value
  setlocal fo=aw2tq
endfunction

" Opens tmp file for refactoring
"
command Refactor               call Refactor()
function! Refactor()
    let linenum = line(".")
    let tmpfile = tempname().fnamemodify(bufname('%'), ":t")
    execute 'r !cat % > '.tmpfile
    execute 'e '.tmpfile
    execute ':'.linenum
    normal! zz
endfunction

function! RunFlog()
  let metrics = system("flog " . expand("%:p"))
  let loclist = []

  for line in split(metrics, '\n')
    let err = line
    let lnum = 1
    call add(loclist, { 'bufnr': bufnr('%'), 'lnum': lnum, 'text': err })
  endfor

  call setloclist(0, loclist)
  lopen
endfunction

command -nargs=* Crclass   call CreateClass(<f-args>)
command -nargs=* Crmodule  call CreateModule(<f-args>)

function! CreateClass(...)
  call CreateEntity('c', a:1)
endfunction

function! CreateModule(...)
  call CreateEntity('m', a:1)
endfunction

function! CreateEntity(...)
  let dirname = expand('%:p:h').'/'.expand('%:r')
  let type_of_extraction = a:1
  let camel_case_name = a:2
  let underscore_name = substitute(a:2,'\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)','\l\1_\l\2',' g')
  let filename = underscore_name.'.rb'
  let fullpath = dirname.'/'.filename

  if !isdirectory(expand(dirname))|call mkdir(expand(dirname), "p", 0700)|endif

  wincmd v
  wincmd l
  silent exe "e ".fullpath

  if filereadable(expand(fullpath))
    return
  endif

  if type_of_extraction == 'm'
    let first_line = 'module '.camel_case_name
    let l2         = '  class << self'
    let l3         = '    def call()'
    let l4         = '    end'
    let l5         = '  end'
    let last_line  = 'end'

    call setline(1, first_line)
    call setline(2, l2)
    call setline(3, l3)
    call setline(4, l4)
    call setline(5, l5)
    call setline(6, last_line)
  elseif type_of_extraction == 'c'
    let first_line = 'class '.camel_case_name
    let l2         = '  attr_reader :foo'
    let l3         = ''
    let l4         = '  def self.perform(foo)'
    let l5         = '    new(foo).perform'
    let l6         = '  end'
    let l7         = ''
    let l8         = '  def initialize(foo)'
    let l9         = '    @foo = foo'
    let l10        = '  end'
    let l11        = ''
    let l12        = '  def perform(foo)'
    let l13        = '  end'
    let last_line  = 'end'

    call setline(1, first_line)
    call setline(2,  l2)
    call setline(3,  l3)
    call setline(4,  l4)
    call setline(5,  l5)
    call setline(6,  l6)
    call setline(7,  l7)
    call setline(8,  l8)
    call setline(9,  l9)
    call setline(10, l10)
    call setline(11, l11)
    call setline(12, l12)
    call setline(13, l13)
    call setline(14, last_line)
  endif
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

nmap <leader>f :BufExplorer<CR>
" Buffer Explorer

" Open Buffer by number
"
nmap <leader><leader>1 :b 1<cr>
nmap <leader><leader>2 :b 2<cr>
nmap <leader><leader>3 :b 3<cr>
nmap <leader><leader>4 :b 4<cr>
nmap <leader><leader>5 :b 5<cr>
nmap <leader><leader>6 :b 6<cr>
nmap <leader><leader>7 :b 7<cr>
nmap <leader><leader>8 :b 8<cr>
nmap <leader><leader>9 :b 9<cr>
nmap <leader><leader>10 :b 10<cr>
nmap <leader><leader>11 :b 11<cr>
nmap <leader><leader>12 :b 12<cr>
nmap <leader><leader>13 :b 13<cr>
nmap <leader><leader>14 :b 14<cr>
nmap <leader><leader>15 :b 15<cr>
nmap <leader><leader>16 :b 16<cr>
nmap <leader><leader>17 :b 17<cr>
nmap <leader><leader>18 :b 18<cr>
nmap <leader><leader>19 :b 19<cr>
nmap <leader><leader>20 :b 20<cr>
nmap <leader><leader>21 :b 21<cr>
nmap <leader><leader>22 :b 22<cr>
nmap <leader><leader>23 :b 23<cr>
nmap <leader><leader>24 :b 24<cr>
nmap <leader><leader>25 :b 25<cr>
nmap <leader><leader>26 :b 26<cr>
nmap <leader><leader>27 :b 27<cr>
nmap <leader><leader>28 :b 28<cr>
nmap <leader><leader>29 :b 29<cr>
nmap <leader><leader>30 :b 30<cr>


set pastetoggle=<F6>
" Do not autoindent lines, when paste from OS buffer

" Open current buffer in new tab
nmap <leader>t :sp<cr><C-w>T

" Close tab
nmap <leader>W :tabclose<cr>

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
nmap <leader>h :tabp<cr>
nmap <leader>l :tabn<cr>

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

" Quit Vim and close all windows without saving
nnoremap Q :qa!<cr>

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

vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`<
" Fold everything, except visually selected block

nnoremap <Leader>za :loadview<cr>
" Restore folds

nmap <silent><Leader>zs <Esc>zRzz
" Unfold everything

nmap <leader>zz :call ToggleFold()<CR>

" Fugitive & Flayouts shortcuts
noremap <leader>gb :Gblame<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gw :Gbrowse<CR>

noremap <leader>gh :GllogPatchTab 200<cr>
noremap <leader>h  :GllogPatch 200 %<cr>
noremap <leader><leader>gh :GllogPatchTab 200 %<cr>
noremap <leader><leader>h  :GllogPatch 200<cr>

noremap <leader>gp :GlpullRequestSummaryTab<cr>
noremap <leader>gc :GlpullRequestCommitsTab<cr>

noremap <leader><leader>gp :call GlpullRequestSummaryTabOrigin()<cr>
noremap <leader><leader>gc :call GlpullRequestCommitsTabOrigin()<cr>

function! GlpullRequestSummaryTabOrigin()
  execute 'GlpullRequestSummaryTab origin/'.fugitive#head()
endfunction

function! GlpullRequestCommitsTabOrigin()
  execute 'GlpullRequestCommitsTab origin/'.fugitive#head()
endfunction

command -nargs=* Gpcheckout call Gpcheckout(<f-args>)

function! Gpcheckout(arg)
  let cmd = 'git pcheckout '.a:arg
  echom "Checking out ".a:arg.' ...'
  call system(cmd)
  execute 'GlpullRequestSummaryTab'
  execute 'GlopenFromDiff'
endfunction

noremap <leader><leader>r :GlresolveConflict<cr>

"""" Commit helpers
" Open current buffer in new tab, show git diff in vertical split, open :Gstatus
nnoremap <leader><Space> :Glc<CR>
noremap <leader>D :Git! diff<cr>
noremap <leader>C :Git! diff --cached<cr>
noremap <leader>G :Git! pget patch
"---
"

"""" Diff helpers
" Run :Gdiff (current file diff view between staged and unstaged version)
noremap <leader><leader>d :Gdiff<CR>

" Close Diff view and return to a file
noremap <leader><leader>do :call GdiffOff()<cr>

function! GdiffOff()
  windo diffoff
  windo set nowrap
  bdelete //0
endfunction

"noremap <leader><leader>o :windo diffoff<cr>:windo set nowrap<cr><c-w>h:bd<cr>:vsp<cr><c-w>l@c
vmap <leader>0 :diffget<cr>
vmap <leader>9 :diffput<cr>
"---

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
let NERDTreeMapJumpPrevSibling='none'
let NERDTreeMapJumpNextSibling='none'
nmap <silent><leader>d :call NERDTreeToggleWithFind()<CR>

""" Vim-Ruby
let ruby_no_expensive = 1
let g:rails_ctags_arguments='--exclude=.rsync*'

" Use Ack instead of Grep
set grepprg=ack\ -a

" Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Easymotion
map f <Plug>(easymotion-prefix)

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
let g:gitgutter_realtime = 0

" CtrlP.vim
let g:ctrlp_map = ',,e'
let g:ctrlp_regexp = 0
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_tabpage_position = 'al'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/]doc[\/]|\.(git|rsync_cache|idea|)$'
let g:ctrlp_by_filename = 1

"Bufexplorer
let g:bufExplorerFindActive=0

" Syntastic
nmap <silent><leader>e :Errors<CR>

" ChooseWin
nmap  M  <Plug>(choosewin)

" Flog
let g:flog_enable = 0
let g:flog_medium_limit = 15
let g:flog_high_limit   = 25
let g:flog_hide_low     = 1
let g:flog_hide_medium  = 0
nmap <silent><leader><leader>c :call ShowComplexity()<CR>

" Reek
let g:reek_always_show = 0
let g:reek_on_loading = 0

" CODE COMPLETION BLOCK
set completeopt+=longest

let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 50
let g:neocomplcache_disable_auto_complete = 1

" Expand selected NeoSnippet (when more than one in list)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <c-p> <c-x><c-p>

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
if has("gui_running") " =======================================================
  au VimEnter * silent! call BgSwitch('light')
else
  au VimEnter * silent! call BgSwitch('dark')
endif " =======================================================================

"Restore custor position on file open
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"---
"


" Check if file was edited outside of Vim
"au InsertEnter,InsertLeave,CursorHold,BufEnter * checktime

" Fast exit from insert mode
set ttimeoutlen=10
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END
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

nmap <leader>е :sp<cr><C-w>T
nmap <silent><leader>м <C-w>v
nmap <silent><leader>ы <C-w>s
nmap <silent><leader>ч <C-w>c
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
