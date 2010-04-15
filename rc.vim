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
set autoread

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
set statusline=%<%f%h%m%r%h%w%y\ %{&ff}\ %{strftime('%a\ %b\ %e\ %I:%M\ %p')}%=\ lin:%l\,%L\ col:%c%V\ %P
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)


" Do not wrap text

set nowrap
set noswapfile
"set visualbell

" Show 3 line after and before cursor when scrolling
set scrolloff=3

""" Buffers

set hidden " Allow dirty unsaved buffers

""" Appearance

colorscheme evening     " Color theme

""" Search

set ignorecase " Ignore case when searching
set showcmd    " Show incomplete cmds down the bottom
set showmode   " Show current mode down the bottom

"set incsearch  " Find the next match as we type the search
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
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set showtabline=2  "tabs bar
  set laststatus=2   "file status
  colorscheme glowchalk "ir_black vrdual --  Colorscheme
  set gfn=Terminus\ 10 " Monospace\ 9 --  GUI Font
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

"map <C-a> :bprev<CR>
"map <C-s> :bnext<CR>
map <C-Tab> :BufExplorer<CR>

imap <F4> <C-w>c
nmap <F4> <C-w>c

""

"" Tabs

"map <F5> <esc>:tabnew<cr>
map <C-Left> <esc>:tabprevious<cr>
map <C-Right> <esc>:tabnext<cr>
map <C-a> <esc>:tabprevious<cr>
map <C-s> <esc>:tabnext<cr>
"imap <F5> <esc>:tabnew<cr>
imap <C-Left> <esc>:tabprevious<cr>
imap <C-Right> <esc>:tabnext<cr>
imap <F8> <esc>:tabclose<cr>

"" Ctrl+C & Ctrl+V to system buffer

nmap <C-v> "+gp
imap <C-v> <ESC><C-v>i
vmap <C-c> "+y

imap <C-o> <ESC>O
imap <C-o> <ESC>o

"" Ctrl+L to clear highlight

" TODO: map turn off highlightig on any mode
"map <C-i> :nohls<CR><C-L>
"map <C-i> <C-O>:nohls<CR>
map <C-n> :noh<CR>
"map <Leader>ri :Rinitializer<Space>

" F3 - Save File
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

"" Folding

nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

"" Indent

"" Move block of text

"imap <C-S-h> <ESC><<
"imap <C-S-l> <ESC>>>
"nmap <C-S-h> <<
"nmap <C-S-l> >>
vmap <C-h> <gv
vmap <C-l> >gv

"imap <C-S-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
"imap <C-S-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z
"nmap <C-S-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
"nmap <C-S-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z
vmap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z


"" Windows

" Navigate between windows

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

""""""""" Toggle maximize/unmaximize
"nnoremap <C-W>O :call MaximizeToggle ()<CR>
"nnoremap <C-W>o :call MaximizeToggle ()<CR>
"nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>
"
"function! MaximizeToggle()
"  if exists("s:maximize_session")
"    exec "source " . s:maximize_session
"    call delete(s:maximize_session)
"    unlet s:maximize_session
"    let &hidden=s:maximize_hidden_save
"    unlet s:maximize_hidden_save
"  else
"    let s:maximize_hidden_save = &hidden
"    let s:maximize_session = tempname()
"    set hidden
"    exec "mksession! " . s:maximize_session
"    only
"  endif
"endfunction

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

imap <C-Space> <C-x><C-o>

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

imap <F3> :FuzzyFinderTextMate<CR>
nmap <F3> :FuzzyFinderTextMate<CR>
"imap <F2> :CommandT<CR>
"nmap <F2> :CommandT<CR>

""" NERDTree

" Ctrl+D map to toggle NERDTree

nmap <silent> <F1> :NERDTreeToggle<CR>
imap <silent> <F1> :NERDTreeToggle<CR>

nmap <silent> <C-F1> :g/def /<CR>
imap <silent> <C-F1> :g/def /<CR>

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

"imap <C-/> <ESC>,cc
"nmap <C-/> ,cc

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
map , ?

 "                                                                           "
"*****************************************************************************"
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
"* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
"*****************************************************************************"
 "                                                                           "
