#!/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

install_paru() {
	if ! command -v paru &>/dev/null; then
		echo -e "${GREEN}Installing:${NC} paru"
		sudo pacman -S --needed base-devel
		local clone_dir="$HOME/Clone/paru"
		git clone https://aur.archlinux.org/paru.git "$clone_dir"
		cd $clone_dir
		makepkg -si
	else
		echo -e "${YELLOW}Already installed:${NC} paru"
	fi
}

install_packages() {
	local -a package_list=()
	local -a not_installed_packages=()

	source ./packages.sh

	for pkg in "${packages[@]}"; do
		if ! paru -Qi "$pkg" &>/dev/null; then
			if paru -Si "$pkg" &>/dev/null; then
				package_list+=("$pkg")
			else
				not_installed_packages+=("$pkg")
			fi
		else
			echo -e "${YELLOW}Already installed:${NC} $pkg"
		fi
	done

	if [ ${#package_list[@]} -ne 0 ]; then
		echo "Installing packages..."
		paru -S "${package_list[@]}"
	else
		echo "All specified packages are already installed or were not found."
	fi

	if [ ${#not_installed_packages[@]} -ne 0 ]; then
		echo -e "${RED}The following packages were not found in the repositories and could not be installed:${NC}"
		printf '%s\n' "${not_installed_packages[@]}"
	fi
}

main() {
	install_paru
	install_packages
}

main "$@"
