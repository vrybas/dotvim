## My Vim for Ruby on Rails development
![](http://f.cl.ly/items/1i2S0x1S060D3m2d2A3M/Screenshot_6_19_13_7_25_PM.png)

#### Warning for MacVim users ####
I've stopped using MacVim(mostly) and started using console Vim in Tmux.
The lastest MacVim config extracted to the
[**macvim**](https://github.com/vrybas/dotvim/tree/macvim) branch and no
longer supported. But still contains most of the features described here.

## Features ##
   * **Ruby on Rails projects support** → [VimRails](http://github.com/tpope/vim-rails)
   * **Project Tree View** → [NERDTree](http://github.com/scrooloose/nerdtree)
   * **Project search with Ack** → [Ack.vim](http://github.com/mileszs/ack.vim)
   * **Open Files switcher** → [BufExplorer](http://github.com/vim-scripts/bufexplorer.zip)
   * **Popup Open File dialog with smart search** → [CtrlP](https://github.com/kien/ctrlp.vim)
   * **Code completion on Tab** → [SuperTab](http://github.com/ervandew/supertab) and [NeoComplCache](http://github.com/Shougo/neocomplcache.vim)
   * **Graphical tree-like undo/redo tool** → [Gundo](http://github.com/sjl/gundo.vim)
   * **Incredible GIT support** → [Fugitive](http://github.com/tpope/vim-fugitive)
   * **Indication of added/modified/removed lines** → [Vim-GitGutter](https://github.com/airblade/vim-gitgutter)
   * **Create/manage gists on Github** → [Gist](http://github.com/mattn/gist-vim)
   * **Jump to class/method definition** → [Ctags](http://ctags.sourceforge.net)
   * **Open online Ruby/Rails/Rspec documentation** from [APIDock](http://apidock.com)
   * **Open ri documentation** → [Ri.vim](https://github.com/danchoi/ri.vim)
   * **Syntax checking** → [Checksyntax.vim](https://github.com/tomtom/checksyntax_vim)
   * **Bundler support** → [vim-bundler] (https://github.com/tpope/vim-bundler)
   * **Rake support** → [vim-rake] (https://github.com/tpope/vim-rake)
   * **Rbenv support** → [vim-rbenv] (https://github.com/tpope/vim-rbenv)
   * **Tmux splits integration** → [vim-tmux-navigator] (https://github.com/christoomey/vim-tmux-navigator) | [help] (http://robots.thoughtbot.com/post/53022241323/seamlessly-navigate-vim-and-tmux-splits)

=====
   * **Snippets** → [vim-snipmate](http://github.com/garbas/vim-snipmate)
   * **Maximize/unmaximize active split** → [ZoomWin](http://github.com/vim-scripts/ZoomWin)
   * **Bulk lines commenting based on syntax** → [NERDCommenter](http://github.com/scrooloose/nerdcommenter)
   * **Auto-closing quotes, brackets etc.** → [DelimitMate](http://github.com/vim-scripts/delimitMate.vim)
   * **Jump between quotes, brackets etc.** → [Matchit](http://github.com/tsaleh/vim-matchit)
   * **Jump around code with keystrokes** → [Easymotion](http://github.com/Lokaltog/vim-easymotion)
   * **Surround selected text with any symbols and replace surroundings on-the-fly** → [Surround](http://github.com/tpope/vim-surround)
   * **Smart text selection** → [Smartpairs](https://github.com/gorkunov/smartpairs.vim)
   * **Open scratch buffer which is never saved** → [VimScratch](http://github.com/duff/vim-scratch)
   * **Solarized theme** → [Solarized](http://github.com/altercation/vim-colors-solarized)

=====
   * **Hide everything, except selected text** (stay focused!)
   * **Toggle straight/relative line numbers to use with movement operations**
   * **Move code blocks left/right/up/down**
   * **Open current split in new tab**
   * **Open tabs by numbers**
   * **Restore cursor position on file open**
   * **Remove spaces from the end of each line on save**
   * **Cyrillic keys mapped to latin to use in command mode**
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
   8. gem ctags (see [troubleshooting](https://github.com/tpope/gem-ctags#troubleshooting))
   9. mvim /path/to/project
   10. :e any_file_in_path
   11. :Rtags

## Keymap (above Vim & plugins standard) ##

* `space` -  Save file
* `,e` - "Open File" dialog
* `,f` - Show opened files
* `,d` - Open project Tree View

### Tabs
* `,t` - Open current buffer in new tab
* `,h/l` - Previous/Next tab
* `,1..9` - Go to 1..9 tab
* `,g` - Open class/function definition in new tab

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

### Git
* `gh` - Jump to next git change
* `gH` - Jump to previous git change
* `@d` - Git Diff (show unstaged changes)
* `@c` - Git Diff (show staged changes)
* `@r` - Git request-pull patch output in new buffer (from current branch to master)

### Fugitive
[Fugitive.vim - a complement to command line git](http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/)

* `,gb` - Git Blame
* `,gs` - Git Status
* `W` - Open git commit or blob in the browser (:Gbrowse)

### Git Commit View
* `,,c` - Open "Git Commit View" in new tab (current file, unstaged changes, git
  status window)
* `,,c` - (again) Save entered commit message(if any), make commit, close tab
  with "Git Commit View"
* `,u` - Close tab with "Git Commit View" without making a commit (keeping
  staged and unstaged changes as is)
* `,gm` - Read last commit message to the current buffer
* `,go` - Read last 15 commit messages to the current buffer
* `,wm` - Highlight everything above 50 symbols (for git commit message)
* `,wc` - Highlight everything above 72 symbols (for git commit comments)

### Git Pull Request View
* `,,p` - Open "Git Pull Request View" in new tab (git request-pull diff
  between current branch and master)
* `O`   - Open file, containing chunk of code under cursor, with :Gblame
  window

### Git Diff View (opens from Commit View)
[Fugitive.vim - working with the git index](http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/)

* `,,d` - Run :Gdiff (current file diff view between staged and unstaged version)
* `,0`  - `:diffget`
* `,9`  - `:diffput`
* `,,o` - Close Diff view and show staged changes

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
* `'j`  - Easymotion
* `,m`  - Clear search highlighting
* `,y`  - Toggle display trailing characters
* `,,i` - Check syntax
* `,a`  - Search on current path with Ack
* `,r`  - Toggle relative/straight line numbers
* `F6`  - Do not autoindent lines, when paste from OS buffer (when pasting big code block)
* `,u`  - Toggle open graphical tree-based undo

