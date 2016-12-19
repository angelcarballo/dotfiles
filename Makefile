DOTFILES := $(shell pwd)
FOLDERS_TO_LINK := cheats common emacs git git_template ruby spacemacs tmux vim zsh

# Run always
.PHONY: git rbenv vim

default: update link vim

update:
	git pull

# Link dotfiles on HOME folder using stow
link:
	stow -v -t $(HOME) -d $(DOTFILES) $(FOLDERS_TO_LINK)

# Install new vim plugins, update existing and cleanup old ones
vim:
	vim +PlugInstall! +qall
	vim +PlugUpdate! +qall
	vim +PlugClean! +qall

# Setup git global ignore, repo template, fancy diff and aliases
git:
	# global ignore list
	git config --global core.excludesfile ~/.gitignore_global
	# tell git to use our nice repo template
	git config --global init.templatedir '~/.git_template'
	# use diff-so-fancy when diffing
	git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX --pattern '^(Date|added|deleted|modified): '"
	git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX --pattern '^(Date|added|deleted|modified): '"
	# aliases
	git config --global alias.ci commit
	git config --global alias.st status
	git config --global alias.co checkout
	git config --global alias.b branch
	git config --global alias.ctags '!~/.git_template/hooks/ctags'

# Install rbenv with ruby-build, rbenv-default-gems and rbenv-ctags plugins
rbenv:
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
	git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags

# Install homebrew and install dependencies with homebrew/bundle
homebrew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle

tmux_plugin_manager:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

base16:
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	curl https://raw.githubusercontent.com/kristijanhusak/vim-hybrid-material/master/base16-material/base16-material.dark.sh -o ~/.config/base16-shell/scripts/base16-material-dark.sh
	curl https://raw.githubusercontent.com/kristijanhusak/vim-hybrid-material/master/base16-material/base16-material.light.sh -o ~/.config/base16-shell/scripts/base16-material-light.sh
	chmod +x ~/.config/base16-shell/scripts/*.sh


all: update homebrew link vim git rbenv tmux_plugin_manager base16

