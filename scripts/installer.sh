#!/bin/bash

source ~/Clone/oh-my-hyprland/scripts/colors.sh
source ~/Clone/oh-my-hyprland/scripts/install_git.sh
source ~/Clone/oh-my-hyprland/scripts/install_paru.sh
source ~/Clone/oh-my-hyprland/scripts/install_packages.sh
source ~/Clone/oh-my-hyprland/scripts/install_fonts.sh
source ~/Clone/oh-my-hyprland/scripts/install_dotfiles.sh
source ~/Clone/oh-my-hyprland/scripts/change_shell.sh

main() {
	log_file="oh-my-hyprland.log"

	echo -e "${success} Starting installation..."

	install_git 2>&1 | tee -a "$log_file" || {
		echo -e "${error} Failed to Install: git"
		exit 1
	}

	install_paru 2>&1 | tee -a "$log_file" || {
		echo -e "${error} Failed to Install: paru"
		exit 1
	}

	install_packages 2>&1 | tee -a "$log_file" || {
		echo -e "${error} Failed to Install: packages"
		exit 1
	}

	install_fonts 2>&1 | tee -a "$log_file" || {
		echo -e "${error} Failed to Install: fonts"
		exit 1
	}

	install_dotfiles 2>&1 | tee -a "$log_file" || {
		echo -e "${error} Failed to Install: dotfiles"
		exit 1
	}

	change_shell 2>&1 | tee -a "$log_file" || {
		echo -e "${error} Failed to: change shell"
		exit 1
	}
}

main "$@"
