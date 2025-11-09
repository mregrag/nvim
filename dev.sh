git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$HOME/.local/nvim
make install

if ! grep -q 'nvim/bin' ~/.bashrc; then
  echo 'export PATH="$HOME/.local/nvim/bin:$PATH"' >> ~/.bashrc
fi
source ~/.bashrc

cd ..
rm -rf neovim

git clone git@github.com:mregrag/nvim.git ~/.config/nvim
