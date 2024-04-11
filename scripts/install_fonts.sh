install_fonts() {
	fonts="../assets/fonts"
	fontsDir="${HOME}/.local/share/fonts/"

	if [ ! -d "${local_fonts_dir}" ]; then
		echo -e "${GREEN}==> Creating fonts directory:${NC} ${fontsDir}"
		mkdir -p "${fontsDir}"
	fi

	if [ -d "${fonts}" ]; then
		echo -e "${GREEN}==> Installing fonts${NC}: ${fonts}"
		cp -r "${fonts}/"* ${fontsDir}
		echo -e "${GREEN}==> Updading installed fonts...${NC}"
		fc-cache -f -v
	fi
}
