sudo clear
echo "==============================="
echo "=       Updating Pacman       ="
echo "==============================="

sudo pacman -Syyu
echo "==============================="
echo "=     Installing Packages     ="
echo "==============================="

PACKAGES=(
    'git'
    'curl'
    'geany'
    'wget'
    'zsh'
    'neovim'
    'nodejs'
    'npm'
    'python'
    'yarn'
    'jre8-openjdk'
    'w3m'
    'archlinux-keyring'
    'unzip'
    'python-neovim'
    'python-pip'
)

for PACKAGE in "${PACKAGES[@]}"; do
  echo "Installing: ${PACKAGE}..."
  sudo pacman -S "$PACKAGE" --noconfirm --needed
done

PACKAGES_AUR=(
    'yay'
    'cava'
)

for PACKAGE_AUR in "${PACKAGES_AUR[@]}"; do
echo "Installing: ${PACKAGE_AUR}..."
git clone https://aur.archlinux.org/"${PACKAGE_AUR}".git
cd "${PACKAGE_AUR}"
makepkg -si
cd ..
done


echo "Installing: Salwyrr Launcher..."
wget https://www.salwyrr.com/linux/install_salwyrr_launcher.sh -P ~/ && chmod +x ~/install_salwyrr_launcher.sh && ~/./install_salwyrr_launcher.sh

echo "Installing: kwin-tiling"
git clone https://github.com/faho/kwin-tiling.git
cd kwin-tiling
plasmapkg2 --type kwinscript -i .
cd ..

echo "==============================="
echo "=        Copying Files        ="
echo "==============================="

sudo cp -r .dotfiles ~/
sudo cp -r neofetch ~/.config/
sudo cp -r colorschemes_konsole ~/local/share/konsole/
sudo cp -r images ~/Downloads
sudo cp -r .fonts ~/

echo "==============================="
echo "=      Installing Fonts       ="
echo "==============================="

git clone https://github.com/terroo/fonts -b fonts --single-branch
cd fonts/fonts && mv $HOME/.local/share/
fc-cache -fv

echo "==============================="
echo "=      Installing NVChad      ="
echo "==============================="

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

echo "Installing: Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing: ZSH Plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

echo "Installing: tty-clock"
git clone https://github.com/xorg62/tty-clock.git
cd tty-clock
sudo make install
cd ..

echo "Installing: pipes.sh"
git clone https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
mv pipes.sh ~/.local/share/
echo 'alias pipes="$HOME/.local/share/pipes.sh"' >> ~/.zshrc
source ~/.zshrc
cd ..

echo "Installing: colorssh"
wget http://bit.ly/colorssh -O colors.sh
chmod +x colors.sh
mv colors.sh ~/.local/share/
echo 'alias colors="$HOME/.local/share/colors.sh"' >> ~/.zshrc
source ~/.zshrc

echo "Installing: pacman.sh"
wget http://bit.ly/pacmansh -O pacman.sh
chmod +x pacman.sh
mv pacman.sh ~/.local/share/
echo '$HOME/.local/share/pacman.sh' >> ~/.zshrc


echo "Installation Completed... System Ready to use"
