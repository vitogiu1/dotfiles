sudo clear

echo "==============================="
echo "Installing Packages"
echo "==============================="

PACKAGES=(
    'git'
    'curl'
    'wget'
    'zsh'
    'neovim'
    'nodejs'
    'npm'
    'python'
    'yarn'
    'jre8-openjdk'
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

cp -r .config ~/

echo "Installation Completed... System Ready to use"