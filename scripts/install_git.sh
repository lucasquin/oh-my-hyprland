install_git() {
	if ! command -v "git" &>/dev/null; then
		echo -e "${GREEN}==> Installing:${NC} git"
		sudo pacman -S git
	else
		echo -e "${YELLOW}==> Already installed:${NC} git"
	fi
}
