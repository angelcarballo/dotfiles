Dotfiles
========

My collection of dotfiles. If you want to reuse any of this, clone the repository and review the code, it's probably better to pick an choose what you need.

![Screenshot](https://raw.githubusercontent.com/angelcarballo/dotfiles/master/screenshot.png)

Key Features
------------

* [Stow] - Used to manage dotfiles using symbolic links.
* [Vim] - Vim is awesome, and I use it for almost everything. Installation and maintenance done via [vim-plug].

* [Tmux] - I use Tmux next to Vim to achieve a single terminal workflow. These two are made for each other.

* [Zsh] - A few plugins managed using [Antigen], and a light theme based on [pure].

[Tmux]: https://tmux.github.io/
[Stow]: https://www.gnu.org/software/stow/
[Zsh]: http://www.zsh.org/
[Vim]: http://www.vim.org/
[Antigen]: https://github.com/zsh-users/antigen
[pure]: https://github.com/sindresorhus/pure
[vim-plug]: https://github.com/junegunn/vim-plug

Usage
-----

```shell
# Initial setup
git clone https://github.com/angelcarballo/dotfiles.git && cd dotfiles && make all

# If you want to use Zsh, set it as your default shell:
chsh -s $(which zsh)

# To update repo, links and vim plugins
make
``````

Local changes and extra commands
--------------------------------

Zsh will try to source `~/.zshrc.local`. Put your local settings, env vars, etc. there if you need them for a particular machine but don't want them in your dotfiles.

Goodies
-------

Since both Vim and Tmux are using the [Hybrid] color scheme, you'll need to setup the right profile for your terminal. Also, use a Powerline font if you want those fancy icons on you status bar.

* [Hybrid for iTerm2]
* [Powerline Fonts]

[Hybrid for iTerm2]: https://gist.github.com/luan/6362811
[Powerline Fonts]: https://github.com/powerline/fonts
[Hybrid]: https://github.com/w0ng/vim-hybrid

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
