DOTFILES := $(shell pwd)
FOLDERS_TO_LINK := git ruby tmux vim cheat common zsh joplin espanso ctags
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
.PHONY: update_dotfiles update_base16 update_homebrew link_mac link_server update_vim_plugins vim_minpac install_rbenv install_homebrew install_base16 sync_tasks setup_mac install_gitstatus update_cheats

default:
	$(MAKE) $(DEFAULT_TASK)

default_mac: update link_mac update_vim_plugins update_base16 update_homebrew update_cheats

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
	vim "+call minpac#update()" "+qall"
	vim "+call minpac#clean()" "+qall"

# Install minpac vim plugin manager
vim_minpac:
	@echo "\n${GREEN}Installing minpac${NC}"
	git clone https://github.com/k-takata/minpac.git $(DOTFILES)/vim/.vim/pack/minpac/opt/minpac

sync_tasks:
	@echo "\n${GREEN}Syncing tasks${NC}"
	task sync

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

update_cheats:
	@echo "\n${GREEN}Updating community cheats${NC}"
	if [ -d ~/src/dotfiles/cheats/community ]; then cd ~/src/dotfiles/cheats/community && git pull; else git clone https://github.com/cheat/cheatsheets.git ~/src/dotfiles/cheats/community; fi
