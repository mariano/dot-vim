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

If using the solarized theme in KDE, the appropriate [Konsole profile] [konsole-solarized]
has to be installed, and the XTERM has to be configured to inform itself as 256 color
capable by: 

1. Opening a Konsole window.
2. Clicking on the menu Settings -> Configure Profiles.
3. In the opened window, click on Edit Profile next to your default profile.
4, In the General tab, click on Edit next to Environment.
5. Change the TERM line to:

```
TERM=xterm-256color
```

[konsole-solarized]: https://github.com/phiggins/solarized/tree/master/konsole-solarized
