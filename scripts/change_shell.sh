change_shell() {
	if [ "$(basename "${SHELL}")" != "zsh" ]; then
		echo -e "${GREEN}==> Changing shell to:${NC} Zsh"
		chsh -s /bin/zsh
	fi
}
