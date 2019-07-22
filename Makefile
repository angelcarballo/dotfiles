DOTFILES := $(shell pwd)
FOLDERS_TO_LINK := git ruby tmux vim cheats common git_template taskwarrior zsh alacritty
FOLDERS_TO_LINK_ON_SERVERS := git ruby tmux vim common zsh

# Set default task based on OS
UNAME := $(shell uname)
ifeq ($(UNAME),Linux)
	DEFAULT_TASK := default_server
endif
ifeq ($(UNAME),Darwin)
	DEFAULT_TASK := default_mac
endif

GREEN=\033[1;32m
NC=\033[0m # No Color

# Tasks that do not generate a file (and are always executed)
.PHONY: update_dotfiles update_base16 update_homebrew link_mac link_server update_vim_plugins git_config vim_minpac install_rbenv install_homebrew install_base16 sync_tasks setup_mac install_gitstatus

default:
	$(MAKE) $(DEFAULT_TASK)

default_mac: update link_mac update_vim_plugins update_base16 sync_tasks update_homebrew

default_server: update link_server update_vim_plugins

setup_mac: install_rbenv install_homebrew install_base16 default_mac install_gitstatus

update:
	@echo "\n${GREEN}Updating dotfiles${NC}"
	git pull

update_base16:
	@echo "\n${GREEN}Updating Base16 colorschemes${NC}"
	cd ~/.config/base16-shell && git pull

update_homebrew:
	@echo "\n${GREEN}Updating Homebrew packages${NC}"
	brew update
	brew upgrade
	brew cleanup

link_mac:
	@echo "\n${GREEN}Linking dotfiles (MacOS)${NC}"
	stow -v -t $(HOME) -d $(DOTFILES) $(FOLDERS_TO_LINK) --ignore='DS_Store'

link_server:
	@echo "\n${GREEN}Linking dotfiles (Server)${NC}"
	stow -v -t $(HOME) -d $(DOTFILES) $(FOLDERS_TO_LINK_ON_SERVERS)

# Install new vim plugins, update existing and cleanup old ones
update_vim_plugins:
	@echo "\n${GREEN}Updating Vim plugins${NC}"
	vim +PackUpdate +qall
	vim +PackClean +qall

# Setup git global ignore, repo template, fancy diff and aliases
git_config:
	@echo "\n${GREEN}Setting git configuration${NC}"
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

# Install minpac vim plugin manager
vim_minpac:
	@echo "\n${GREEN}Installing minpac${NC}"
	git clone https://github.com/k-takata/minpac.git $(DOTFILES)/vim/.vim/pack/minpac/opt/minpac

sync_tasks:
	@echo "\n${GREEN}Syncing tasks${NC}"
	task sync

# Install rbenv with ruby-build, rbenv-default-gems and rbenv-ctags plugins
install_rbenv:
	@echo "\n${GREEN}Installing rbenv${NC}"
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	mkdir -p ~/.rbenv/plugins
	git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems
	git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
	git clone https://github.com/rbenv/rbenv-each.git ~/.rbenv/plugins/rbenv-each

# Install homebrew and install dependencies with homebrew/bundle
install_homebrew:
	@echo "\n${GREEN}Installing Homebrew${NC}"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle

install_base16:
	@echo "\n${GREEN}Installing Base16 colorschemes${NC}"
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	chmod +x ~/.config/base16-shell/scripts/*.sh

install_gitstatus:
	@echo "\n${GREEN}Installing Gitstatus plugin${NC}"
	git clone https://github.com/romkatv/gitstatus.git ~/src/gitstatus
