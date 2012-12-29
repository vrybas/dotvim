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
 Bundle 'tpope/vim-rails'
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
 Bundle 'cohama/rsense'
 Bundle 'cfurrow/vim-l9'
 Bundle 'chrismetcalf/vim-autocomplpop'
 Bundle 'ervandew/supertab'
 Bundle 'duff/vim-scratch'

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

set mouse=a
" Mouse in all modes


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

  " Change color scheme by daytime :
  "
  let dayBegin = 6
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
  "


  colorscheme solarized
  " My favorite color scheme

  set gfn=Monaco:h14
  " Font settings


endif " =======================================================================

"*****************************************************************************"
"
" Functions and commands
"
"*****************************************************************************"



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


"*****************************************************************************"
"
" Key mappings
"
"*****************************************************************************"

let mapleader = ","
" Leader key mapping

noremap <leader><leader> <ESC>
inoremap <leader><leader> <ESC>

map <M-a> :bprev<CR>
" Previous buffer

map <M-s> :bnext<CR>
" Next buffer

map <C-Tab> :BufExplorer<CR>
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



" Move visually selected blocks of text
"
vmap <C-S-h> <gv
" Left

vmap <C-S-l> >gv
" Right

vmap <C-S-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z
" Up

vmap <C-S-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
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
nnoremap <C-l> <C-w>l
" Left

nnoremap <C-h> <C-w>h
" Right

nnoremap <C-k> <C-w>k
" Up

nnoremap <C-j> <C-w>j
" Down




" Use <Tab> to move between brackets
"
nnoremap <tab> %
vnoremap <tab> %
map <tab> %


nnoremap <leader>a :Ack<space>
" Search with Ack

nmap <silent><leader>y :set nolist!<CR>
" Show trailing characters

nnoremap <leader>m :noh<CR>
" Clear highlight

nmap <silent><leader><tab> :Sscratch<CR>
" Opens a buffer which is never saved (for scratches)

nmap <silent><leader>r :call ToggleRelNumber()<cr>
" Toggle relative and straight line numbers


vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`<
" Fold everything, except visually selected block

nmap <silent><Leader>zs <Esc>zRzz
" Unfold everything
"
nmap <silent><Leader>d :g/def /<CR>
imap <silent><Leader>d :g/def /<CR>


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

" ConqueTerm
"
com Zsh :call ZshStart()<CR>

fun! ZshStart()
  ConqueTerm zsh
endf

let g:ConqueTerm_Color = 0

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

" Autocomplete setup
let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1

" Use Ack instead of Grep
set grepprg=ack\ -a

" Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Easymotion
let g:EasyMotion_leader_key = '<leader>'

" Another user functions
"
" Sudo promt with :w!!
cmap w!! %!sudo tee > /dev/null %

"""" Toggle show trailing characters
set listchars=tab:>-,trail:·,eol:$

let g:SuperTabDefaultCompletionType = 'context'

let g:rsenseUseOmniFunc = 1

 "                                                                           "
"*****************************************************************************"
"
" Auto commands
"
"*****************************************************************************"
 "                                                                           "

autocmd BufEnter * if &filetype == "" | set ft=ruby | endif
" Set filetype to 'ruby' by default to have syntax highlight everywhere


"Remove all spaces from end of each line and save file on focus lost
au BufReadPost * call RemoveSpaces()
au FocusLost * silent! wa
au FocusLost * silent! :Rtags

"Restore custor position on file open
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

 autocmd FileType *
     \ if &omnifunc != '' |
     \   call SuperTabChain(&omnifunc, "<c-p>") |
     \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
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
