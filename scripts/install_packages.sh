packages=(
	"pipewire-jack"
	"zsh"
	"eza" # improves "ls" command
	"hyprland"
	"waybar" # bar
	"neovim"
	"vim"
	"kitty"
	"rofi" # menu launcher
	"qt5-wayland"
	"dunst"
	"xdg-desktop-portal-hyprland"
	"qt6-wayland"
	"nemo" # file manager
	"grimblast-git" # screenshot tool
	"slurp" # region select for screenshot/screenshare
	"swappy" # screenshot editor
	"cliphist" # clipboard manager
)

install_packages() {
	local -a package_list=()
	local -a not_installed_packages=()

	for pkg in "${packages[@]}"; do
		if ! paru -Qi "$pkg" &>/dev/null; then
			if paru -Si "$pkg" &>/dev/null; then
				package_list+=("$pkg")
			else
				not_installed_packages+=("$pkg")
			fi
		else
			echo -e "${warning} Already installed: $pkg"
		fi
	done

	if [ ${#package_list[@]} -ne 0 ]; then
		echo -e "${success} Installing packages..."
		paru -S "${package_list[@]}"
	else
		echo -e "${warning} All specified packages are already installed or were not found."
	fi

	if [ ${#not_installed_packages[@]} -ne 0 ]; then
		echo -e "${error} The following packages were not found in the repositories and could not be installed:"
		printf '%s\n' "${not_installed_packages[@]}"
	fi
}
