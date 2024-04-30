install_fonts() {
	fonts="$HOME/Clone/oh-my-hyprland/assets/fonts/"
	fontsDir="$HOME/.local/share/fonts/"

	if [ ! -d "${fontsDir}" ]; then
		echo -e "${success} Creating fonts directory: ${fontsDir}"
		mkdir -p "${fontsDir}"
	fi

	echo -e "${success} Installing fonts from ${fonts}"
	cp -r "${fonts}"* "${fontsDir}"

	echo -e "${success} Updating installed fonts..."
	fc-cache -f -v
}
