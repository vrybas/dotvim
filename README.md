## My Vim for Ruby on Rails development
![vim-window][1]

#### Warning for MacVim users ####
I've stopped using MacVim(mostly) and started using console Vim in Tmux.
The lastest MacVim config extracted to the [**macvim**][2] branch and no
longer supported. But still contains most of the features described here.

## Features ##
   * **Ruby on Rails projects support** → [VimRails][3]
   * **Project Tree View** → [NERDTree][4] and [vim-vinegar][36]
   * **Project search with Ack** → [Ack.vim][5]
   * **Open Files switcher** → [BufExplorer][6]
   * **Popup Open File dialog with smart search** → [CtrlP][7]
   * **Code completion on Tab** → [SuperTab][8] and [NeoComplCache][9]
   * **Graphical tree-like undo/redo tool** → [Gundo][10]
   * **Incredible GIT support** → [Fugitive][11] and [Flayouts][12]
   * **Indication of added/modified/removed lines** → [Vim-GitGutter][13]
   * **Create/manage gists on Github** → [Gist][14]
   * **Jump to class/method definition** → [Ctags][15]
   * **Open online Ruby/Rails/Rspec documentation** from [APIDock][16]
   * **Open ri documentation** → [Ri.vim][17]
   * **Syntax checking** → [Checksyntax.vim][18]
   * **Bundler support** → [vim-bundler][19]
   * **Rake support** → [vim-rake][20]
   * **Rbenv support** → [vim-rbenv][21]
   * **Tmux splits integration** → [vim-tmux-navigator][22] | [help][23]

=====
   * **Snippets** → [vim-snipmate][24]
   * **Maximize/unmaximize active split** → [ZoomWin][25]
   * **Bulk lines commenting based on syntax** → [NERDCommenter][26]
   * **Auto-closing quotes, brackets etc.** → [DelimitMate][27]
   * **Jump around code with keystrokes** → [Easymotion][29]
   * **Surround selected text with any symbols and replace surroundings on-the-fly** → [Surround][30]
   * **Smart text selection** → [Smartpairs][31]
   * **Open scratch buffer which is never saved** → [VimScratch][32]
   * **List of recently used files** → [MRU][33]
   * **Solarized theme** → [Solarized][34]

=====
   * **Hide everything, except selected text** (stay focused!)
   * **Toggle straight/relative line numbers to use with movement operations**
   * **Move code blocks left/right/up/down**
   * **Open current split in new tab**
   * **Open tabs by numbers**
   * **Restore cursor position on file open**
   * **Remove spaces from the end of each line on save**
   * **Cyrillic keys mapped to latin to use in `normal` mode**
   * **Friendly text/markdown files editing with wrapping and ULTIMATE paragraph formatter**
   * **Spell checking english and russian(with ё) texts**

## Installation ##
   1. git clone git://github.com/vrybas/dotvim.git ~/.vim
   2. echo "runtime! rc.vim" > ~/.vimrc
   3. git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
   4. vim +BundleInstall +qall
   5. brew install ack
   6. brew install ctags
   7. gem install gem-ctags
   8. gem ctags (see [troubleshooting][35]
   9. mvim /path/to/project
   10. :e any_file_in_path
   11. :Rtags

## Keymap (above Vim & plugins standard) ##

* `space` -  Save file
* `,e` - "Open File" dialog
* `,f` - Show opened files
* `,d` - Open project Tree View
* `Q`  - Quit Vim and close all windows without saving

### Tabs
* `,t` - Open current buffer in new tab
* `,h/l` - Previous/Next tab
* `,1..9` - Go to 1..9 tab
* `,g` - Open class/function definition in new tab
* `,W` - Close tab

### Buffers
* `,,1..30` - Go to 1..30 buffer
* `,x` - Close current buffer
* `,,x` - Close and delete current buffer
* `,Tab` - Open scratch buffer which is never saved
* `,h/l` - Previous/Next buffer

### Splits
* `,v` - Create vertical split
* `,s` - Create horisontal split
* `,H/J/K/L` - Resize split in left/down/up/right directions
* `,o` - Maximize/unmaximize split
* `,x` - Close split
* `Ctrl-h/j/k/l` - Switch to left/down/up/right

### Fugitive and Flayouts
[Fugitive.vim - a complement to command line git](http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/)

[Flayouts.vim - layouts for Fugitive](http://github.com/vrybas/vim-flayouts)

* `,gb` - Git Blame
* `,gs` - Git Status

##### Git Commit
* `,<space>` - Open `:Glstatus` in new tab (current file, unstaged
  changes, git status window).
* `,,s` - (again) Save entered commit message(if any), make commit, close tab
  with `:Glstatus`.
* `,u` - Close tab with `:Glstatus` without making a commit (keeping
  staged and unstaged changes as is)
* `,gm` - Read last commit message to the current buffer
* `,go` - Read last 15 commit messages to the current buffer

##### Git Log View
* `,gh`  - Show last 200 commit of all files in new tab
* `,,gh` - Show last 200 commit of current file in new tab
* `,gp`  - Show pull-request summary between current branch and base branch
* `,gc`  - Show commits log between current branch and base branch
* `,,gp` - Show pull-request summary between current branch and origin
* `,,gc` - Show commits log between current branch and origin
* `,gw`  - Open git commit or blob in the browser (:Gbrowse)

* `,D` - Git diff
* `,C` - Git diff --cached
* `,h` - Git log -p of current file (last 100 commits)
* `,,h` - Git log -p (last 200 commits)
* `,N` - Jump to next commit (in diff mode)
* `,P` - Jump to previous commit (in diff mode)
* `,G` - Get diff or patch of PR or Commit, specified by URL (via [git-pget][37])

* `<space>`   - Open file, containing chunk of code under cursor (works in any diff)

##### Git Diff View (opens from Commit View)
[Fugitive.vim - working with the git index](http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/)

* `,,d` - Run :Gdiff (current file diff view between staged and unstaged version)
* `,0`  - `:diffget`
* `,9`  - `:diffput`
* `,,do` - Close Diff view

##### Git Conflict Resolution
* `,,r` - Open `:GlresolveConflict` for current file.
Opens current file in new tab, shows HEAD version, conflicted MERGE
version, and "both modified" version of the file.

### Open Ruby/Rails documentation
* `RR` - APIDock open Rails documentation for method under cursor
* `RB` - APIDock open Ruby documentation
* `RS` - APIDock open Rspec documentation
* `RI` - Open Ri documentation with autocompletive search in horisontal split
* `RIV` - Open Ri documentation in vertical split
* `RK` - Open Ri documentation for keyword under cursor

### Folds
* `,zz` - Toggle fold method (manual/indent)
* `,za` - Fold everything, except selected lines (Visual mode, manual fold method)
* `,zs` - Unfold everything
* `,za` - Restore folds

### Move selected line(s) around (in visually select mode)
* `,fh` - Move left
* `,fj` - Move down
* `,fk` - Move up
* `,fl` - Move right

### Markdown and Text Files
* `,w4..8` - Set vertical ruler and autowrapping to 40..80 symbols
* `,wm`  - Set vertical ruler and autowrapping to 78 symbols (Email standard)
* `,wg`  - Set vertical ruler and autowrapping to 72 symbols for writing commit messages (@tpope's [post](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) on that)
* `,y` - Format and copy selected text to the clipboard without line breaks
* `t<Tab>` - Insert Github Flavored Markdown task `- [ ]`
* `t` - Mark task as current (highlight)
* `T` - Complete a task or group of tasks

### Other
* `Tab` - code completion (including tags and snippets, slow)
* `Ctrl-p` - local code completion (opened files, faster)
* `Ctrl-k` - expand snipped, selected from dropdown list (single snipped expanded with Tab)
* `fw`  - Easymotion
* `,m`  - Clear search highlighting
* `,y`  - Toggle display trailing characters
* `,,i` - Check syntax
* `,a`  - Search on current path with Ack
* `F6`  - Do not autoindent lines, when paste from OS buffer (when pasting big code block)
* `,u`  - Toggle open graphical tree-based undo


[1]: http://f.cl.ly/items/1i2S0x1S060D3m2d2A3M/Screenshot_6_19_13_7_25_PM.png
[2]: https://github.com/vrybas/dotvim/tree/macvim
[3]: http://github.com/tpope/vim-rails
[4]: http://github.com/scrooloose/nerdtree
[5]: http://github.com/mileszs/ack.vim
[6]: http://github.com/vim-scripts/bufexplorer.zip
[7]: https://github.com/kien/ctrlp.vim
[8]: http://github.com/ervandew/supertab
[9]: http://github.com/Shougo/neocomplcache.vim
[10]: http://github.com/sjl/gundo.vim
[11]: http://github.com/tpope/vim-fugitive
[12]: http://github.com/vrybas/vim-flayouts
[13]: https://github.com/airblade/vim-gitgutter
[14]: http://github.com/mattn/gist-vim
[15]: http://ctags.sourceforge.net
[16]: http://apidock.com
[17]: https://github.com/danchoi/ri.vim
[18]: https://github.com/tomtom/checksyntax_vim
[19]: https://github.com/tpope/vim-bundler
[20]: https://github.com/tpope/vim-rake
[21]: https://github.com/tpope/vim-rbenv
[22]: https://github.com/christoomey/vim-tmux-navigator
[23]: http://robots.thoughtbot.com/post/53022241323/seamlessly-navigate-vim-and-tmux-splits
[24]: http://github.com/garbas/vim-snipmate
[25]: http://github.com/vim-scripts/ZoomWin
[26]: http://github.com/scrooloose/nerdcommenter
[27]: http://github.com/vim-scripts/delimitMate.vim
[29]: http://github.com/Lokaltog/vim-easymotion
[30]: http://github.com/tpope/vim-surround
[31]: https://github.com/gorkunov/smartpairs.vim
[32]: http://github.com/duff/vim-scratch
[33]: http://github.com/yegappan/mru
[34]: http://github.com/altercation/vim-colors-solarized
[35]: https://github.com/tpope/gem-ctags#troubleshooting
[36]: http://github.com/tpope/vim-vinegar
[37]: http://github.com/vrybas/dotfiles/blob/master/bin/git-pget
