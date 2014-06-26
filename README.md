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

### Spaces vs. Tabs ###

Tab spacing is enabled by default. If on a project you want to swtich to spaces,
create a `.lvimrc` file on the root path of the project with the following
contents:

```text
:call Spaces()
```

### PHPCS ####

If you want to run PHPCS on a project, create a `.lvimrc` file on the root
path of the project, and add the following (make sure your paths match):

```text
:let g:phpqa_codesniffer_args = "--standard=/home/mariano/phpcs-standard.xml"
:let g:phpqa_codesniffer_cmd="/usr/local/bin/phpcs"
:let g:phpqa_messdetector_autorun = 0
:let g:phpqa_codecoverage_autorun = 0
:let g:phpqa_codesniffer_autorun = 1
```
