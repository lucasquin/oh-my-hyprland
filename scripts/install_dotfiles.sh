install_dotfiles() {
	files=(
		"Clone/oh-my-hyprland/configs/.config/rofi"
		"Clone/oh-my-hyprland/configs/.config/.zshrc"
		"Clone/oh-my-hyprland/configs/.config/hypr"
		"Clone/oh-my-hyprland/configs/.config/kitty"
		"Clone/oh-my-hyprland/configs/.config/waybar"
    "Clone/oh-my-hyprland/configs/.config/dunst"
		"Clone/oh-my-hyprland/configs/.config/kdeglobals"
	)

	if [ ! -d "${HOME}/.config" ]; then
		echo -e "${success} Creating .config folder..."
		mkdir -p "${HOME}/.config"
	fi

	install_dotfile() {
		local source_path="${HOME}/${1}"
		local target_path="${HOME}/.config/$(basename "${1}")"
		local target_dir=$(dirname "${target_path}")

		if [ ! -d "${target_dir}" ]; then
			echo -e "${success} Creating directory for: ${target_dir}..."
			mkdir -p "${target_dir}"
		fi

		if [ -e "${target_path}" ] || [ -h "${target_path}" ]; then
			echo -e "${warning} Removing existing item at: ${target_path}..."
			rm -rf "${target_path}"
		fi

		echo -e "${success} Creating a new symlink for: ${source_path} at ${target_path}"
		if ln -s "${source_path}" "${target_path}"; then
			echo -e "${success} Successfully created symlink for: ${source_path}"
		else
			echo -e "${error} Failed to create symlink for: ${source_path}"
		fi
	}

	for file in "${files[@]}"; do
		install_dotfile "${file}"
	done
}
