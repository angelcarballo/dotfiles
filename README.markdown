Dotfiles
========

My collection of dotfiles. If you want to reuse any of this, clone the repository and review the code, it's probably better to pick an choose what you need.

Key Features
------------

* [Stow] - Manage dotfiles using symbolic links.
* [Vim] - Text editing nirvana. Installation and maintenance done via [vim-plug].
* [Tmux] - Perfect with Vim, these two are made for each other. Some [fzf] love to quickly [open and jump between sessions].
* [Zsh] - A few plugins managed using [Antigen], and a light theme based on [pure].
* [Base16 Shell] - Makes the whole thing look better, and allows switching between dark and light color schemes on the fly.

[Tmux]: https://tmux.github.io/
[Stow]: https://www.gnu.org/software/stow/
[Zsh]: http://www.zsh.org/
[Vim]: http://www.vim.org/
[Antigen]: https://github.com/zsh-users/antigen
[pure]: https://github.com/sindresorhus/pure
[vim-plug]: https://github.com/junegunn/vim-plug
[fzf]: https://github.com/junegunn/fzf
[open and jump between sessions]: https://github.com/angelcarballo/dotfiles/blob/master/tmux/.tmux.conf#L121-L125
[Base16 Shell]: https://github.com/chriskempson/base16-shell

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
