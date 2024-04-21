install_git() {
	if ! command -v "git" &>/dev/null; then
		echo -e "${success} Installing: git"
		sudo pacman -S git
	else
		echo -e "${warning} Already installed: git"
	fi
}
