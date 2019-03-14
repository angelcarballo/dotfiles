DOTFILES := $(shell pwd)
FOLDERS_TO_LINK := git ruby tmux vim cheats common git_template
FOLDERS_TO_LINK_ON_SERVERS := git ruby tmux vim

# Run always
.PHONY: update_dotfiles update_base16 update_homebrew link_dotfiles_mac link_dotfiles_server update_vim_plugins git_config install_rbenv install_homebrew install_base16

default: default_mac

default_mac: update_dotfiles update_homebrew link_dotfiles_mac update_vim_plugins update_base16
default_server: update_dotfiles link_dotfiles_server update_vim_plugins

update_dotfiles:
	git pull

update_base16:
	cd ~/.config/base16-shell && git pull

update_homebrew:
	brew update
	brew upgrade
	brew cleanup

link_dotfiles_mac:
	stow -v -t $(HOME) -d $(DOTFILES) $(FOLDERS_TO_LINK) --ignore='DS_Store'
	stow -v -t $(HOME)/.config -d $(DOTFILES) $(FOLDERS_TO_LINK_ON_CONFIG) --ignore='DS_Store'

link_dotfiles_server:
	stow -v -t $(HOME) -d $(DOTFILES) $(FOLDERS_TO_LINK_ON_SERVERS)

# Install new vim plugins, update existing and cleanup old ones
update_vim_plugins:
	vim +PackUpdate +qall
	vim +PackClean +qall

# Setup git global ignore, repo template, fancy diff and aliases
git_config:
	# global ignore list
	git config --global core.excludesfile ~/.gitignore_global
	# tell git to use our nice repo template
	git config --global init.templatedir '~/.git_template'
	# use diff-so-fancy when diffing
	git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX --pattern '^(Date|added|deleted|modified): '"
	git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX --pattern '^(Date|added|deleted|modified): '"
	# don't require confirmation or force for git clean
	git config --global clean.requireForce false
	# show full diff on commit window
	git config --global commit.verbose true
	# aliases
	git config --global alias.ci commit
	git config --global alias.st status
	git config --global alias.co checkout
	git config --global alias.b branch
	git config --global alias.m merge
	git config --global alias.f fetch
	git config --global alias.p pull
	git config --global alias.ctags '!~/.git_template/hooks/ctags'
	git config --global alias.prune "fetch --prune"
	git config --global alias.undo "reset --soft HEAD^"
	git config --global alias.stashall "stash save --include-untracked"
	# better git diff colors (suggested by diff-so-fancy)
	git config --global color.ui true
	git config --global color.diff-highlight.oldNormal    "red bold"
	git config --global color.diff-highlight.oldHighlight "red bold 52"
	git config --global color.diff-highlight.newNormal    "green bold"
	git config --global color.diff-highlight.newHighlight "green bold 22"
	git config --global color.diff.meta                   "yellow"
	git config --global color.diff.frag                   "magenta bold"
	git config --global color.diff.commit                 "yellow bold"
	git config --global color.diff.old                    "red bold"
	git config --global color.diff.new                    "green bold"
	git config --global color.diff.whitespace             "red reverse"

# Install rbenv with ruby-build, rbenv-default-gems and rbenv-ctags plugins
install_rbenv:
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	mkdir -p ~/.rbenv/plugins
	git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
	git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
	git clone https://github.com/rbenv/rbenv-each.git ~/.rbenv/plugins/rbenv-each

# Install homebrew and install dependencies with homebrew/bundle
install_homebrew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle

install_base16:
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	chmod +x ~/.config/base16-shell/scripts/*.sh
