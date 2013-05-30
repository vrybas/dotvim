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
 Bundle 'topfunky/PeepOpen-EditorSupport', {'rtp': 'vim-peepopen/'}
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


"*****************************************************************************"
"
" Look and feel
"
"*****************************************************************************"

colorscheme default

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


colorscheme default
" Clear coloscheme settings


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


"*****************************************************************************"
"
" GUI settings
"
"*****************************************************************************"

let g:solarized_termtrans = 1
" Use terminal background for Solarized when run MacVim from terminal
" (fix for iTerm2)


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

  set gfn=Monaco:h12
  " Font settings


endif " =======================================================================

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

  " Highlights used by the GitGutter signs.
  hi! link SignColumn Background
  highlight GitGutterAdd          guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
  highlight GitGutterChange       guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
  highlight GitGutterDelete       guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE
  highlight default link GitGutterChangeDelete GitGutterChange

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
function! AutoSave()
  if (&modified == 1)
    call RemoveSpaces()
    execute 'w!'
    execute 'GitGutter'
  endif
endfunction


"*****************************************************************************"
"
" Key mappings
"
"*****************************************************************************"

let mapleader = ","
" Leader key mapping

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
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

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
" Down



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

nmap <silent><leader>i :CheckSyntax<CR>

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
let g:RspecSplitHorizontal=0
nmap <leader>r :RunSpecLine<cr>
nmap <leader><leader>r :RunSpec<cr>
nmap <leader><leader>rr :RunSpecs<cr>


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


" Autosave events
"
au InsertLeave * silent! call AutoSave()
au BufLeave * silent! call AutoSave()
au FocusLost * silent! call AutoSave()
au CursorHold * silent! call AutoSave()
  " CursorHold timeout
set ut=1000

" Switching clolorscheme events
"
au VimEnter * silent! call BgSwitchDayTime()
au InsertLeave * silent! call BgSwitchDayTime()
au FocusLost * silent! call BgSwitchDayTime()

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
