packages=(
	"pipewire-jack"
	"zsh"
	"eza"
	"hyprland"
	"waybar"
	"neovim"
	"vim"
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
			echo -e "${YELLOW}==> Already installed:${NC} $pkg"
		fi
	done

	if [ ${#package_list[@]} -ne 0 ]; then
		echo "${GREEN}==> Installing packages...${NC}"
		paru -S "${package_list[@]}"
	else
		echo -e "${YELLOW}==> All specified packages are already installed or were not found.${NC}"
	fi

	if [ ${#not_installed_packages[@]} -ne 0 ]; then
		echo -e "${RED}==> The following packages were not found in the repositories and could not be installed:${NC}"
		printf '%s\n' "${not_installed_packages[@]}"
	fi
}
