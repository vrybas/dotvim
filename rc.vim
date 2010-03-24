"*****************************************************************************"
"
"     ______        _____
"   ||      |     ||     |
"    \\     /     \\     |
"     ||   |       /    /
"     ||   |      /    /
"     ||   |     /    /
"      ||   |   /    /
"      ||   | _/   _/
"      ||   |/    |_|
"      ||        / ___ __              ___    ___
"       ||     _/ \\ | \\ \−-_−-_    ||  _/ // _|
"   _   ||    /   || | || /\ /\ |    || |  || |_
"  |_|   ||__/    ||_| ||_||_||_|_   ||_|   \\__|
"
"
"                                         by Aleksandr Koss (http://nocorp.ru)
"                                         forked by Vladimir Rybas
"
"*****************************************************************************"

"                                                                           "
"*****************************************************************************"
"
" Base settings
"
"*****************************************************************************"
 "                                                                           "

set nocompatible " Turn off vi compatible
syntax on        " Turn on syntax highlight
set mouse=a      " Mouse everywhere

set backup       " Enable creation of backup file.
set backupdir=~/.vim/backups  " Where backups will go.
set directory=~/.vim/tmp      " Where temporary files will go.

set history=1000 " Store lots of :cmdline history

set backspace=indent,eol,start " Allow to navigate from start of line to end of previous line

set wildmode=list:longest " Make cmdline tab completion similar to bash

 "                                                                           "
"*****************************************************************************"
"
" Look and feel
"
"*****************************************************************************"
 "                                                                           "

""" Line options

set nu   " Turn on line numbers
"set cul  " Highligth current line

"" Highligth in red more then 80 columns

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

""" Tabulation

" Tab size

set ts=2
set shiftwidth=2  " Make indent equal 2 spaces
set ai            " Auto indent to current level
set si            " Smart indent
set stal=2
set expandtab     " No tabs, no war!

filetype on
filetype plugin on
filetype indent on

" Do not wrap text

set nowrap

""" Buffers

set hidden " Allow dirty unsaved buffers

""" Appearance

colorscheme dual     " Color theme

""" Search

set ignorecase " Ignore case when searching
set showcmd    " Show incomplete cmds down the bottom
set showmode   " Show current mode down the bottom

set incsearch  " Find the next match as we type the search
set hlsearch   " Hilight searches by default

" Page Up & Page Down behaviour

set nostartofline " Don't jump to fisrt line

 "                                                                           "
"*****************************************************************************"
"
" GUI settings
"
"*****************************************************************************"
 "                                                                           "

if has("gui_running")
  set tb=icons      " Only icons in toolbar
  set tbis=tiny     " Set icon size to tiny
  set guioptions-=T " Turn off toolbar
  colorscheme dual  " Color theme
  set gfn=Monospace\ 9 " Font
endif

 "                                                                           "
"*****************************************************************************"
"
" Key maps
"
"*****************************************************************************"
 "                                                                           "

"" Toggle between normal and insert mode

nnoremap <D-x> i
imap <D-x> <Esc>

"" Previous - Next buffer

map <C-a> :bprev<CR>
map <C-s> :bnext<CR>
map <C-Tab> :BufExplorer<CR>

imap <F4> :bdelete<CR>
nmap <F4> :bdelete<CR>

""

"" Ctrl+C & Ctrl+V to system buffer

nmap <C-v> "+gP
imap <C-v> <ESC><C-v>i
vmap <C-c> "+y

imap <C-o> <ESC>O
imap <C-o> <ESC>o

"" Ctrl+L to clear highlight

map <C-i> :nohls<CR><C-L>
map <C-i> <C-O>:nohls<CR>

" F3 - Save File
nmap <F3> :w<cr>
vmap <F3> <esc>:w<cr>
imap <F3> <esc>:w<cr>

"" Folding

nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

"" Indent

"" Move block of text

vmap <C-h> <gv
vmap <C-l> >gv

vmap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z


"" Windows

" Navigate between windows

"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

"" Surround text

"vnoremap " :call Surround('"', '"')<CR>
"vnoremap ' :call Surround("'", "'")<CR>

"""

let i=1
while i<=9
  execute "nmap <D-".i."> ".i."gt"
  execute "vmap <D-".i."> ".i."gt"
  execute "imap <D-".i."> <ESC>".i."gt"
  let i+=1
endwhile


"" Autocomplete

imap <C-z> <C-x><C-o>

"" Other stuff

" Sudo promt with :w!!

cmap w!! %!sudo tee > /dev/null %

 "                                                                           "
"*****************************************************************************"
"
" Plugin configurations
"
"*****************************************************************************"
 "                                                                           "

""" Fuzzy Finder Textmate

" Ctrl+F map to start search

imap <F2> :FuzzyFinderTextMate<CR>
nmap <F2> :FuzzyFinderTextMate<CR>

""" NERDTree

" Ctrl+D map to toggle NERDTree

nmap <silent> <F1> :NERDTreeToggle<CR>
imap <silent> <F1> :NERDTreeToggle<CR>

""" Vim-Ruby

" Autocomplete setup

let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1

""" Ack

" Use instead grep

set grepprg=ack\ -a

" Ctrl+A to start Ack search

"nmap <C-A> :Ack<Space>
"imap <C-A> :Ack<Space>

""" NERDCommenter

imap <D-/> <ESC>,cc
nmap <D-/> ,cc

""" RSense

let g:rsenseHome = "$RSENSE_HOME"

 "                                                                           "
"*****************************************************************************"
"
" Functions
"
"*****************************************************************************"
 "                                                                           "

""" Remove all spaces from end in each line

fun! RemoveSpaces()
  if &bin | return | endif
  if search('\s\+$', 'n')
    let line = line('.')
    let col = col('.')
    sil %s/\s\+$//ge
    call cursor(line, col)
  endif
endf

""" Surround text

fun! Surround(s1, s2) range
  exe "normal vgvmboma\<Esc>"
  normal `a
  let lineA = line(".")
  let columnA = col(".")
  normal `b
  let lineB = line(".")
  let columnB = col(".")
  " exchange marks
  if lineA > lineB || lineA <= lineB && columnA > columnB
    " save b in c
    normal mc
    " store a in b
    normal `amb
    " set a to old b
    normal `cma
  endif
  exe "normal `ba" . a:s2 . "\<Esc>`ai" . a:s1 . "\<Esc>"
endfun

 "                                                                           "
"*****************************************************************************"
"
" Auto commands
"
"*****************************************************************************"
 "                                                                           "

"" Remove all spaces from end of each line

autocmd BufWritePre * call RemoveSpaces()

"" Auto create ctags

"autocmd BufWritePost * !ctags -R > /dev/null

"" Restore last cursor position in file

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
map ф a
map ы s
map в d
map а f
map п g
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
map ю .
map . /

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
map , ?

 "                                                                           "
"*****************************************************************************"
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
"* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
"*****************************************************************************"
 "                                                                           "
