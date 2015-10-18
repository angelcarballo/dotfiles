Dotfiles
========

My collection of dotfiles. If you want to reuse any of this, clone the repository and review the code, it's probably better to pick an choose what you need.

![Screenshot](https://raw.githubusercontent.com/angelcarballo/dotfiles/master/screenshot.png)

Key Features
------------

* [Vim] - Vim is awesome, and I use it for almost everything. My vimrc is heavy on ruby and tmux related plugins, and I try to keep as readable as possible. Installation and maintenance is done using [Vundler].

* [Tmux] - I use Tmux next to Vim to achieve a single terminal workflow. These two are made for each other.

* [Zsh] - Recently moved to Zsh from Bash, so not a lot going on yet. A few plugins managed using [Antigen], and my own minimal theme based on [pure].

[Tmux]: https://tmux.github.io/
[Zsh]: http://www.zsh.org/
[Vim]: http://www.vim.org/
[Antigen]: https://github.com/zsh-users/antigen
[pure]: https://github.com/sindresorhus/pure
[Vundler]: https://github.com/VundleVim/Vundle.vim

Setup
-----

Rake is required for setting up the repo. If you don't have it, a simple `gem install rake` will do.

```shell
git clone https://github.com/angelcarballo/dotfiles.git && cd dotfiles
rake bootstrap
```

If you want to use Zsh, set it as your default shell:

```shell
chsh -s $(which zsh)
```

Keeping multiple machines in sync, just run `rake` and it will update the repo and keep your dotfiles in good shape.

Local changes and extra commands
--------------------------------

Zsh will try to source `~/.zshrc.local`. Put your local settings, env vars, etc. there if you need them for a particular machine but don't want them in your dotfiles. For example:

```shell
# Git
export GIT_AUTHOR_NAME="Angel Carballo"
export GIT_AUTHOR_EMAIL="contact@angelcarballo.com"
```

Goodies
-------

Since both Vim and Tmux are using the Solarized color scheme, you'll need to setup the right profile for your terminal. Also, install a Powerline enabled font if you want nice icons on your Vim statusbar.

* [Solarized for iTerm2]
* [Powerline Fonts]

[Solarized for iTerm2]: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
[Powerline Fonts]: https://github.com/powerline/fonts

References
----------

* [Tim Pope]
* [Chris Toomey]
* [Steve Losh]
* [Thoughbot]

[Tim Pope]: https://github.com/tpope
[Chris Toomey]: https://github.com/christoomey/dotfiles
[Steve Losh]: http://learnvimscriptthehardway.stevelosh.com
[Thoughbot]: https://github.com/thoughtbot/dotfiles
