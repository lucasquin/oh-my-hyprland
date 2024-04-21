install_fonts() {
	fonts="~/Clone/oh-my-hyprland/assets/fonts/"
	fontsDir="${HOME}/.local/share/fonts/"

	if [ ! -d "${local_fonts_dir}" ]; then
		echo -e "${success} Creating fonts directory: ${fontsDir}"
		mkdir -p "${fontsDir}"
	fi

	if [ -d "${fonts}" ]; then
		echo -e "${success} Installing fonts: ${fonts}"
		cp -r "${fonts}/"* ${fontsDir}
		echo -e "${success} Updading installed fonts..."
		fc-cache -f -v
	fi
}
