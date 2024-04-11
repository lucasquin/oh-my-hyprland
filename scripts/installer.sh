#!/bin/bash

source ./colors.sh
source ./install_git.sh
source ./install_paru.sh
source ./install_packages.sh
source ./install_fonts.sh
source ./install_dotfiles.sh
source ./change_shell.sh

main() {
	log_file="install.log"
	echo -e "${GREEN}==> Starting installation..."

	install_git 2>&1 | tee -a "$log_file" || {
		echo -e "${RED}==> Failed to Install:${NC} git"
		exit 1
	}

	
	install_paru 2>&1 | tee -a "$log_file" || {
		echo -e "${RED}==> Failed to Install:${NC} paru"
		exit 1
	}

	install_packages 2>&1 | tee -a "$log_file" || {
		echo -e "${RED}==> Failed to Install:${NC} packages"
		exit 1
	}

	install_fonts 2>&1 | tee -a "$log_file" || {
		echo -e "${RED}==> Failed to Install:${NC} fonts"
		exit 1
	}

	install_dotfiles 2>&1 | tee -a "$log_file" || {
		echo -e "${RED}==> Failed to Install:${NC} dotfiles"
		exit 1
	}

	change_shell 2>&1 | tee -a "$log_file" || {
		echo -e "${RED}==> Failed to:${NC} change shell"
		exit 1
	}
}

main "$@"
