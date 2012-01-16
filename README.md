# My .vim directory #

## INSTALL ##

```bash
$ cd ~
$ git clone https://mariano@github.com/mariano/dot-vim.git .vim
$ cd ~/.vim
$ git submodule update --init
$ cd ~
$ ln -s .vim/.vimrc
```

### CommandT ###

CommandT will require an extra step: compilation of the C ruby extension. To do
so:

```bash
$ cd ~/.vim/bundle-available/command-t/ruby/command-t
$ ruby extconf.rb
$ make
```
