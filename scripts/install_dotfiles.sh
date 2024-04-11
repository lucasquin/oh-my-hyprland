install_dotfiles() {
	files=(
		../configs/.zshrc
		../configs/.config/hypr
		../configs/.config/kitty
		../configs/.config/waybar
		../configs/.config/wofi
		../configs/.config/kdeglobals
	)

	if [ ! -d "${HOME}/.config" ]; then
		echo -e "${GREEN}==> Creating .config folder...${NC}"
		mkdir "${HOME}/.config"
	fi

	install_dotfile() {
		local source_path="${PWD}/${1}"
		local target_path="${HOME}/$(echo ${1} | sed 's|\.\./configs/||')"
		local target_dir=$(dirname "${target_path}")

		if [ ! -d "${target_dir}" ]; then
			echo -e "${GREEN}==> Creating directory for:${NC} ${target_dir}..."
			mkdir -p "${target_dir}"
		fi

		if [ -e "${target_path}" ] || [ -h "${target_path}" ]; then
			echo -e "${YELLOW}Removing existing item at:${NC} ${target_path}..."
			rm -rf "${target_path}"
		fi

		echo -e "${GREEN}==> Creating a new symlink for:${NC} ${1} at ${target_path}"
		if ln -s "${source_path}" "${target_path}"; then
			echo -e "${GREEN}==> Successfully created symlink for:${NC} ${1}"
		else
			echo -e "${RED}==>Failed to create symlink for:${NC} ${1}"
		fi
	}

	for file in "${files[@]}"; do
		install_dotfile "${file}"
	done
}
