Dotfiles
========

My collection of dotfiles. If you want to reuse any of this, clone the
repository and review the code, it's probably better to pick an choose what you
need.


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

Zsh will try to source `~/.zshrc.local`. Put your local settings, env vars,
etc. there if you need them for a particular machine but don't want them in
your dotfiles.
