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
set cul  " Highligth current line

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

set gfn=Anonymous\ Pro  " Font
colorscheme molokai     " Color theme

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
endif

 "                                                                           "
"*****************************************************************************"
"
" Key maps
"
"*****************************************************************************"
 "                                                                           "

"" Previous - Next buffer

map <C-S-Left> :bprev<CR>
map <C-S-Right> :bnext<CR>

"" Page Up & Page Down behaviour

nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>

nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

"" Ctrl+C & Ctrl+V to system buffer

"nmap <C-V> "+gP
"imap <C-V> <ESC><C-V>i
"vmap <C-C> "+y

" Ctrl+L to clear highlight

nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Folding

nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

"" Indent

" Emulate TextMate behaviour

nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"" Windows

" Navigate between windows

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" Surround text

vnoremap " :call Surround('"', '"')<CR>
vnoremap ' :call Surround("'", "'")<CR>

"" Other staff

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

nnoremap <C-F> :FuzzyFinderTextMate<CR>

""" NERDTree

" Ctrl+D map to toggle NERDTree

nmap <silent> <C-D> :NERDTreeToggle<CR>
imap <silent> <C-D> :NERDTreeToggle<CR>

""" Vim-Ruby

" Autocomplete setup

let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1

""" Ack

" Use instead grep

set grepprg=ack\ -a

" Ctrl+A to start Ack search

nmap <C-A> :Ack<Space>
imap <C-A> :Ack<Space>

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
