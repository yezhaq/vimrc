### About
My vimrc files, contains lots of settings, the operating system is Ubuntu, 
other Linux system should also works.

### Requirement
* Vim version must be under 8.2.1066, because neocomplete not work above version 8.2.1066
* Vim build with Lua, Ruby, Python support

### Vim build in Ubuntu:
Install dependency packages:
```
sudo apt-get install ruby ruby-dev lua5.2 lua5.2-dev libncurse5-dev
```

Get and build vim:
```
git clone https://github.com/vim/vim.git
cd vim
git checkout v8.2.1065
./configure --with-features=huge --enable-pythoninterp=yes --enable-rubyinterp=yes --enable-cscope --enable-luainterp=yes --prefix=/usr/
make
```

If make success, run:
```
sudo make install
```

### Vim Plugin install
In bash, run:
```
mkdir -p .vim/bundle; cd ~/.vim/bundle; git clone https://github.com/VundleVim/Vundle.vim.git
```

Build command-t ruby extend library:
```
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/; ruby extconf.rb; make
```

open Vim, run command:
```
:PluginInstall
```

### Normal mode key mappings
* <F2\>: tagbar toggle
* <F3\>: NERDTree toggle
* <F4\>: redraw screen
* <F5\>: jump to quick fix list next item
* <F6\>: jump to quick fix list previous item
* <F9\>: open command-t 
* <F10\>: grep the word under cursor
* <F12\>: open a terminal in a new windows
* <alt+l\>: the same as CTRL-W l, move cursor to windows left of current one
* <alt+h\>: the same as CTRL-W h, move cursor to windows right of current one
* <alt+j\>: the same as CTRL-W j, move cursor to windows above of current one
* <alt+k\>: the same as CTRL-W k, move cursor to windows below of current one

### Terminal mode mappings:
* <ctrl+^\>: switch to previous buffer as in normal mode
* <alt+d\>: quick terminal
* <alt+p\>: paste content to the terminal
* <alt+b\>: open buffer explorer
* <alt+n\>: terminal go back to normal mode
* <alt+l\>: the same as CTRL-W l, move cursor to windows left of current one
* <alt+h\>: the same as CTRL-W h, move cursor to windows right of current one
* <alt+j\>: the same as CTRL-W j, move cursor to windows above of current one
* <alt+k\>: the same as CTRL-W k, move cursor to windows below of current one

### Key remap
* <c-y\>: in insert mode, remap to function GetAboveWord(), that will insert the word above current position instead of insert a character
* K: in normal mode, remap to function K_func(), it will first try to jump to the tag, if fails, fall back to normal K function

### commands
* GTAG: generate gtags for source under current directory
* File: open current edit file in system editor
* Dir: open current directory in system file explorer
* G <keyword>: grep keyword in current directory, the searching file patterns is specify in grepprg options
* Gr <keyword>: grep keyword in current directory, search all kinds of files

### ve.c
ve.c is for edit files in terminal, “ve file” will open file for edit in current Vim,
not start another vim program in terminal window.

build and install:
```
gcc -o ve.elf ve.c
sudo cp ve.elf /usr/bin/ve
```
