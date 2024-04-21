change_shell() {
	if [ "$(basename "${SHELL}")" != "zsh" ]; then
		echo -e "${success} Changing shell to: Zsh"
		chsh -s /bin/zsh
	fi
}
