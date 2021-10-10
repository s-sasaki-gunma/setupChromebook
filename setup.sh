#更新・インストール
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y task-japanese locales-all fonts-noto-cjk fonts-noto-cjk-extra fonts-ipafont fonts-ipaexfont fonts-mplus ibus-mozc vim-gtk* nano wget xfce4-terminal
#
#地域設定・言語設定
sudo localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
. /etc/default/locale
#
#日本語入力の設定
echo '
Environment="GTK_IM_MODULE=ibus"
Environment="QT_IM_MODULE=ibus"
Environment="XMODIFIERS=@im=ibus"
Environment="GDK_BACKEND=x11"' | \
sudo tee -a /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
/usr/bin/ibus-daemon -d -x
echo "/usr/bin/ibus-daemon -d -x" >> ~/.sommelierrc
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
#install Anaconda3
ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh"
wget ${ANACONDA_URL} -O Anaconda.sh
sh Anaconda.sh -b
rm Anaconda.sh
echo '
# set PATH of Anaconda3
if [ -d "${HOME}/anaconda3/bin" ] ; then
    export "PATH=${PATH}:${HOME}/anaconda3/bin"
fi' >> .profile
#
#デスクトップエントリーの登録
NOTEBOOK_ICONURL="https://icon-icons.com/downloadimage.php?id=161280&root=2667/PNG/256/&file=jupyter_app_icon_161280.png"
sudo wget ${NOTEBOOK_ICONURL} -O /usr/share/icons/hicolor/256x256/apps/notebook.png
echo "\
[Desktop Entry]
Version=1.0
Name=Jupyter Notebook
Comment=The Jupyter HTML Notebook.
Exec=xfce4-terminal -e \"${HOME}/anaconda3/bin/jupyter-notebook\"
Icon=/usr/share/icons/hicolor/256x256/apps/notebook.png
Terminal=false
Type=Application" | \
sudo tee -a /usr/share/applications/notebook.desktop
echo "Hidden=true" | sudo tee -a /usr/share/applications/xfce4-terminal.desktop
sudo update-desktop-database
#
#GoogleDriveへマウント（事前にホストから共有しておくこと）
ln -s /mnt/chromeos/GoogleDrive/MyDrive/
#
#インプットメソッドの設定
ibus-setup
#
#FINISH
echo "
=-------------=
| F I N I S H |
=-------------="
rm setup.sh