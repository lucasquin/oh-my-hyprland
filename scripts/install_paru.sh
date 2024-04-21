install_paru() {
	if ! command -v cargo &>/dev/null; then
		echo -e "${success} Installing: rust"
		sudo pacman -S rust
	else
		echo -e "${warning} Already installed: rust"
	fi

	if ! command -v paru &>/dev/null; then
		echo -e "${success} Installing: paru"
		sudo pacman -S --needed base-devel
		local clone_dir="$HOME/Clone/paru"
		git clone https://aur.archlinux.org/paru.git "$clone_dir"
		cd $clone_dir
		makepkg -si
	else
		echo -e "${warning} Already installed: paru"
	fi
}
