#更新・インストール
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y vim-gtk*
#
#Vim設定
echo "
set fenc=utf-8
set clipboard=unnamedplus
set number
set laststatus=2
set expandtab
set tabstop=2
set shiftwidth=2
syntax enable
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch" >> ~/.vimrc
#
#FINISH
echo "
=-------------=
| F I N I S H |
=-------------="
rm setupVim.sh