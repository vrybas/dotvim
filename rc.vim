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
set encoding=utf-8
set gdefault " 'g' flag is used by default in commands

"*****************************************************************************"
"
" Look and feel
"
"*****************************************************************************"

""" Line options

set nu   " Turn on line numbers
"set cul  " Highligth current line
"set so=999


" Tab size

set ts=2
set sw=2
set shiftwidth=2  " Make indent equal 2 spaces
set ai            " Auto indent to current level
set si            " Smart indent
set stal=2
set expandtab     " No tabs, no war!

filetype on
filetype plugin on
filetype indent on
"set statusline=%<%f\ %{fugitive#statusline()}\ %=\ lin:%l\,%L\ col:%c%V\ %P
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" Do not wrap text
set nowrap
set noswapfile

" Show 3 line after and before cursor when scrolling
set scrolloff=3

""" Buffers
set hidden " Allow dirty unsaved buffers

""" Appearance
colorscheme default    " Color theme

""" Search
set ignorecase
set smartcase
set showcmd    " Show incomplete cmds down the bottom
set showmode   " Show current mode down the bottom

set incsearch  " Find the next match as we type the search
set hlsearch   " Hilight searches by default
set showmatch

" Page Up & Page Down behaviour
set nostartofline " Don't jump to fisrt line
set vb

 "                                                                           "
"*****************************************************************************"
"
" GUI settings
"
"*****************************************************************************"
 "                                                                           "

if has("gui_running")
  set tb=icons          " Only icons in toolbar
  set tbis=tiny         " Set icon size to tiny
  set guioptions-=m     " remove menu bar
  set guioptions-=T     " remove toolbar
  set guioptions-=r     " remove right-hand scroll bar
  set guioptions-=L     " remove left-hand scroll bar
  set showtabline=2     " tabs bar
  set laststatus=2      " file status
  set background=dark
  colorscheme solarized
  set gfn=Monaco:h13
endif

 "                                                                           "
"*****************************************************************************"
"
" Functions and commands
"
"*****************************************************************************"
 "                                                                           "

" Color switchers


fun! DarkScheme()
  set background=dark
endf

fun! DarkScheme12()
  colorscheme glowchalk
  set gfn=Terminus\ 12
endf

fun! DarkScheme14()
  colorscheme glowchalk
  set gfn=Terminus\ 14
endf

fun! DarkSchemeMonaco()
  colorscheme glowchalk
  set gfn=Monaco\ 10
endf

fun! LightScheme()
  set background=light
endf

fun! GithubScheme(n)
  colorscheme github
  execute ':set gfn=Monaco:h' . a:n
  call LightIndentGuides()
endf

fun! RailscastsScheme(n)
  colorscheme railscasts
  execute ':set gfn=Monaco:h' . a:n
  call DarkIndentGuides()
endf

fun! DarkIndentGuides()
  :hi IndentGuidesOdd  guibg=#333333   ctermbg=3
  ":hi IndentGuidesEven guibg=#000000 ctermbg=4
endf

fun! LightIndentGuides()
  :hi IndentGuidesOdd  guibg=#EFEFEF   ctermbg=3
  ":hi IndentGuidesEven guibg=#EFEFEF ctermbg=4
endf

com Lfdark :call DarkScheme()<CR>
com Lflight :call LightScheme()<CR>
com Lfdark12 :call DarkScheme12()<CR>
com Lfdark14 :call DarkScheme14()<CR>
com Lfdarkmonaco :call DarkSchemeMonaco()<CR>
com Lfgithub :call GithubScheme(11)<CR>
com Lfgithub10 :call GithubScheme(10)<CR>
com Lfrailscasts :call RailscastsScheme(10)<CR>
com Lfrailscasts11 :call RailscastsScheme(11)<CR>

"''''''

" ConqueTerm
com Zsh :call ZshStart()<CR>

fun! ZshStart()
  ConqueTerm zsh
endf

let g:ConqueTerm_Color = 0

" Remove all spaces from end in each line
fun! RemoveSpaces()
  if &bin | return | endif
  if search('\s\+$', 'n')
    let line = line('.')
    let col = col('.')
    sil %s/\s\+$//ge
    call cursor(line, col)
  endif
endf


" Toggle set line numbers relative or straight(Vim 7.3 required)
function ToggleRelNumber()
  if (&relativenumber == 1)
    set nu!
  else
    set relativenumber!
  endif
endfunction

" NerdTree expand behaviour fix
fun! NERDTreeToggleWithFind()
  NERDTreeToggle
  exe "normal \<c-w>l"
  if bufwinnr(t:NERDTreeBufName) > 0
    NERDTreeFind
  end
endf

" Set text wrap and make movements to operate on 1 screen line in wrap mode
fun! WrapLbr()
  set wrap
  set wm=2
  set textwidth=72
  set lbr
  call TYToggleBreakMove()
endf

function! ScreenMovement(movement)
  "if &wrap && b:gmove == 'yes'
  if &wrap && b:gmove == 'yes'
    return "g" . a:movement
  else
    return a:movement
  endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

function! TYShowBreak()
  if &showbreak == ''
    set showbreak=>
  else
    set showbreak=
  endif
endfunction
let b:gmove = "yes"
function! TYToggleBreakMove()
  if exists("b:gmove") && b:gmove == "yes"
    let b:gmove = "no"
  else
    let b:gmove = "yes"
  endif
endfunction
nmap  <expr> ,b  TYShowBreak()
nmap  <expr> ,bb  TYToggleBreakMove()
" - - -

 "                                                                           "
"*****************************************************************************"
"
" Key maps
"
"*****************************************************************************"
 "                                                                           "

let mapleader = ","

noremap <leader><leader> <ESC>
inoremap <leader><leader> <ESC>

"" Previous - Next buffer
map <M-a> :bprev<CR>
map <M-s> :bnext<CR>
map <C-Tab> :BufExplorer<CR>
map <M-d> :BufExplorer<CR>

imap <F3> <C-w>c :set nowrap<CR>
nmap <F3> <C-w>c :set nowrap<CR>
imap <F4> :q!<CR> :set nowrap<CR>
nmap <F4> :q!<CR> :set nowrap<CR>

set pastetoggle=<F6>


""

"" Tabs
nmap <leader>t :sp<cr><C-w>T " Open current buffer in new tab
map <C-Left> <esc>:tabprevious<cr>
map <C-Right> <esc>:tabnext<cr>

" Open tab by number
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

"" Ctrl+C & Ctrl+V to system buffer
nmap <C-v> "+gp
imap <C-v> <ESC><C-v>i
vmap <C-c> "+y

"imap <C-o> <ESC>O
"imap <C-o> <ESC>o


" F2 - Save File
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

"" Move visually selected blocks of text
vmap <C-S-h> <gv
vmap <C-S-l> >gv
vmap <C-S-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-S-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z


"" Windows

" Navigate between windows

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Window resize

nmap + <C-w>+
nmap _ <C-w>-


" Use <Tab> to move between brackets
nnoremap <tab> %
vnoremap <tab> %
map <tab> %


"""" Leader Mappings

nnoremap <leader>a :Ack<space>

nmap <silent> <leader>w :call WrapLbr()<CR>" Enable smart wrapping
nmap <silent> <leader>wo :set nowrap<CR>   " Disable smart wrapping

nmap <silent><leader>y :set nolist!<CR>   " Show trailing characters
nnoremap <leader>n :noh<cr>          " Clear highlight

let g:SuperTabMappingForward = '<leader><tab>'

nmap <silent><leader>v <C-w>v  " Create vertical split
nmap <silent><leader>s <C-w>s  " Create horisontal split
nmap <silent><leader>x <C-w>c  " Close split
nmap <silent><leader>o :ZoomWin<CR> " Expand current split to fullscren/restore split size

nmap <silent><leader><tab> :Sscratch<CR> " Opens a buffer which is never saved

nmap <silent><leader>r :call ToggleRelNumber()<cr>

nmap <silent><leader>b :set ba<CR>   " Show trailing characters

 "                                                                           "
"*****************************************************************************"
"
" Plugin configurations
"
"*****************************************************************************"
 "                                                                           "

""" CommandT for files browsing

" Alt+F map to start search

nmap <M-f> :CommandT<CR>
let g:CommandTMaxHeight=20

""" NERDTree
" F1 to toggle NERDTree
nmap <silent> <D-d> :call NERDTreeToggleWithFind()<CR>
imap <silent> <D-d> :call NERDTreeToggleWithFind()<CR>

"PeepOpen"
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-/> <Plug>PeepOpen
end


nmap <silent> <C-F1> :g/def /<CR>
imap <silent> <C-F1> :g/def /<CR>

""" Vim-Ruby
let ruby_no_expensive = 1

" Autocomplete setup

let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1

""" Ack

" Use instead grep
set grepprg=ack\ -a

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Another user functions
"
" Sudo promt with :w!!
cmap w!! %!sudo tee > /dev/null %


""""" IRB surrounds

let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

"""" Toggle show trailing characters

set listchars=tab:>-,trail:·,eol:$


"""""" Indent Guides plugin configuration
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#EFEFEF   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#EFEFEF ctermbg=4
let g:indent_guides_start_level = 4
let g:indent_guides_guide_size = 1

if has("gui_running")
  autocmd VimEnter * IndentGuidesEnable
endif



 "                                                                           "
"*****************************************************************************"
"
" Auto commands
"
"*****************************************************************************"
 "                                                                           "

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.pill}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
"au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

"au BufRead,BufNewFile *.txt call WrapLbr()

"" Auto create ctags
"autocmd BufWritePost * !ctags -R > /dev/null

"Remove all spaces from end of each line and save file on focus lost
au BufReadPost * call RemoveSpaces()
au FocusLost * silent! wa

"Restore custor position
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Change color scheme by day time
let dayBegin = 8
let nightBegin = 19
let currentTime = str2nr(strftime("%H"))

"if currentTime < nightBegin && currentTime < dayBegin
  ""call RailscastsScheme(10)
  "call GithubScheme(11)
"elseif currentTime > nightBegin && currentTime > dayBegin
  ""call RailscastsScheme(10)
  "call GithubScheme(11)
"else
  "call GithubScheme(12)
"endif

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
"map , ?

 "                                                                           "

"*****************************************************************************"
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
"* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
"*****************************************************************************"
 "                                                                           "
