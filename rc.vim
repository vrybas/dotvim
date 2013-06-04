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
 Bundle 'chrismetcalf/vim-autocomplpop'
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
 Bundle 'git://github.com/tpope/vim-markdown.git'
 Bundle 'git://github.com/skwp/vim-rspec.git'
 Bundle 'git://github.com/kien/ctrlp.vim.git'

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


"*****************************************************************************"
"
" Look and feel
"
"*****************************************************************************"

set nu
" Turn on line numbers

set cc=80
" Set 80 symbols ruler


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

set statusline=%<%f\ %m%r%{fugitive#statusline()}%=%-14.(%l,%c%)\ %P
" Statusline shows relative filepath,
" modified/not, readonly/not, fugitive-related stuff,
" line number, column number, file percentage


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

"*****************************************************************************"
"
" Functions and commands
"
"*****************************************************************************"

function! BgSwitchDayTime()
  " Change color scheme by daytime :
  "
  let dayBegin = 5
  " Sunrise hour

  let nightBegin = 18
  " Sunset hour

  let currentTime = str2nr(strftime("%H"))
  " Get current time

  if currentTime > dayBegin && currentTime < nightBegin
    " If Sun is up

    set background=light
    " use light scheme

  else
    " else

    set background=dark
    " use dark scheme

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

"
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
function ToggleRelNumber()
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
    execute 'GitGutter'
endfunction


"*****************************************************************************"
"
" Key mappings
"
"*****************************************************************************"

let mapleader = ","
" Leader key mapping

nmap <Esc>i :call Save()<CR>
imap <Esc>i <Esc>:call Save()<CR>
nmap <silent><leader>i :call Save()<CR>

map <M-a> :bprev<CR>
" Previous buffer

map <M-s> :bnext<CR>
" Next buffer

map <leader><leader>b :BufExplorer<CR>
" Buffer Explorer


set pastetoggle=<F6>
" Do not autoindent lines, when paste from OS buffer

nmap <leader><leader>t :sp<cr><C-w>T
" Open current buffer in new tab


" Open Tabs by number
"
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt


nnoremap <silent><Leader>g <C-w><C-]><C-w>T
" Open class/function definition in new tab



" Move visually selected blocks of text
"
vmap <S-Left> <gv
" Left

vmap <S-Right> >gv
" Right

vmap <S-Up> :m'<-2<CR>gv=`>my`<mzgv`yo`z
" Up

vmap <S-Down> :m'>+<CR>gv=`<my`>mzgv`yo`z

" Splits mappings
"
nmap <silent><leader>v <C-w>v
" Create vertical split

nmap <silent><leader>s <C-w>s
" Create horisontal split

nmap <silent><leader>x <C-w>c
" Close split

nmap <silent><leader>o :ZoomWin<CR>
" Expand current split to fullscren/restore split size

nmap + <C-w>+
" Resize split

nmap _ <C-w>-
"


" Navigate between splits
"
nnoremap <space>l <C-w>l
" Left

nnoremap <space>h <C-w>h
" Right

nnoremap <space>k <C-w>k
" Up

nnoremap <space>j <C-w>j
" Down




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

nmap <silent><leader>l :call ToggleRelNumber()<cr>
" Toggle relative and straight line numbers


vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`<
" Fold everything, except visually selected block

nmap <silent><Leader>zs <Esc>zRzz
" Unfold everything
"
nmap <silent><Leader>d :g/def /<CR>
imap <silent><Leader>d :g/def /<CR>

nmap <silent><leader>bd :set background=dark<CR>
nmap <silent><leader>bl :set background=light<CR>


nmap <silent><leader><leader>i :CheckSyntax<CR>


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
nmap <silent> <D-d> :call NERDTreeToggleWithFind()<CR>

imap <silent> <D-d> :call NERDTreeToggleWithFind()<CR>

"PeepOpen"
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-/> <Plug>PeepOpen
end

""" Vim-Ruby
let ruby_no_expensive = 1

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

" Rspec.vim
let g:RspecSplitHorizontal=1
nmap <leader>r :RunSpecLine<cr>
nmap <leader><leader>r :RunSpec<cr>
nmap <leader><leader>rr :RunSpecs<cr>

" CtrlP.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_tabpage_position = 'al'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|rsync_cache|idea)$'


" CODE COMPLETION BLOCK

set completeopt+=longest,menu,preview

" For code completion with a drop down menu
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType *
   \ if &omnifunc != '' |
   \   call SuperTabChain(&omnifunc, "<c-p>") |
   \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
   \ endif

let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1"
let g:acp_behaviorKeywordLength = 6

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
au VimEnter * silent! call BgSwitchDayTime()

"Restore custor position on file open
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

 "                                                                           "
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
