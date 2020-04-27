# Dotfiles

My collection of dotfiles. If you want to reuse any of this, clone the
repository and review the code, it's probably better to pick an choose
what you need.

## Usage

``` sh
# initial setup
make setup_mac

# set zsh as default shell
chsh -s $(which zsh)

# update repo, links and vim plugins
make
```

## Minimal vimrc

```sh
curl https://raw.githubusercontent.com/angelcarballo/dotfiles/master/vim/.vimrc.min ~/.vimrc
```

## Local changes and extra commands

Zsh will try to source `~/.zshrc.local`. Put local settings, env vars,
etc. there.
