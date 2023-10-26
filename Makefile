DOTFILES := $(shell pwd)
FOLDERS_TO_LINK := git ruby tmux vim neovim cheat common zsh joplin espanso ctags asdf efm-langserver elixir alacritty postgresql wezterm github vale
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
.PHONY: update_dotfiles update_homebrew link link_server install_rbenv install_homebrew  sync_tasks setup_mac install_gitstatus update_cheats install_extrakto

default:
	$(MAKE) $(DEFAULT_TASK)

default_mac: update link update_cheats
default_linux: update link update_cheats
default_server: update link_server update_vim_plugins

setup_mac: install_homebrew default_mac install_gitstatus install_extrakto
setup_linux: install_gitstatus default_linux

update:
	@echo "\n${GREEN}Updating dotfiles${NC}"
	git pull

update_homebrew:
	@echo "\n${GREEN}Updating Homebrew packages${NC}"
	brew update
	brew upgrade
	brew cleanup

link:
	@echo "\n${GREEN}Linking dotfiles (MacOS/Linux)${NC}"
	stow -v -t $(HOME) -d $(DOTFILES) $(FOLDERS_TO_LINK) --ignore='DS_Store'

link_server:
	@echo "\n${GREEN}Linking dotfiles (Server)${NC}"
	stow -v -t $(HOME) -d $(DOTFILES) $(FOLDERS_TO_LINK_ON_SERVERS)

# Install homebrew and install dependencies with homebrew/bundle
install_homebrew:
	@echo "\n${GREEN}Installing Homebrew${NC}"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew tap Homebrew/bundle
	brew bundle

install_gitstatus:
	@echo "\n${GREEN}Installing Gitstatus plugin${NC}"
	git clone https://github.com/romkatv/gitstatus.git ~/src/gitstatus

update_cheats:
	@echo "\n${GREEN}Updating community cheats${NC}"
	if [ -d ~/src/dotfiles/cheats/community ]; then cd ~/src/dotfiles/cheats/community && git pull; else git clone https://github.com/cheat/cheatsheets.git ~/src/dotfiles/cheats/community; fi

install_extrakto:
	@echo "\n${GREEN}Installing Tmux extrakco plugin${NC}"
	git clone https://github.com/laktak/extrakto ~/src/extrakto

setup_mac_theme_notifier:
	@echo "\n${GREEN}Setting up mac dark/light notifier${NC}"
	swiftc ~/src/dotfiles/macos/dark-mode-notify.swift -o /usr/local/bin/dark-mode-notify
	cp ~/src/dotfiles/macos/ke.bou.dark-mode-notify.plist ~/Library/LaunchAgents/

clean:
	@echo "\n${GREEN}Cleaning up cache (NeoVim)${NC}"
	rm -rf ~/.cache/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.local/share/nvim
	@echo "\n${GREEN}Cleaning up cache (Homebrew)${NC}"
	brew cleanup
	@echo "\n${GREEN}Cleaning up cache (Docker)${NC}"
	docker system prune

