### About
my vimrc files, contains lots of settings

### Noraml mode key mappings
* \<F2\>: tagbar toggle
* \<F3\>: NERDTree toggle
* \<F4\>: redraw screen
* \<F5\>: jump to quick fix list next item
* \<F6\>: jump to quick fix list previous item

* \<F9\>: open command-t 
* \<F10\>: grep the word under cursor
* \<F12\>: run terminal in a new windows

* \<alt+l\>: the same as CTRL-W l, move cursor to windows left of current one
* \<alt+h\>: the same as CTRL-W h, move cursor to windows right of current one
* \<alt+j\>: the same as CTRL-W j, move cursor to windows above of current one
* \<alt+k\>: the same as CTRL-W k, move cursor to windows below of current one

### Terminal mode mappings:
* \<ctrl+^\>: switch to previous buffer as in normal mode
* \<alt+d\>: quick terminal
* \<alt+p\>: paste content to the terminal
* \<alt+b\>: open buffer explorer
* \<alt+n\>: terminal go back to normal mode


### key remap
* \<c-y\>: in insert mode, remap to function GetAboveWord(), that will insert the word above current position instead of insert a character
* K: in normal mode, remap to function K_func(), it will first try to jump to the tag, if fail, fall back to normal K function

