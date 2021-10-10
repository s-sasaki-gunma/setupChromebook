#更新・インストール
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y task-japanese locales-all fonts-noto-cjk fonts-noto-cjk-extra fonts-ipafont fonts-ipaexfont fonts-mplus ibus-mozc
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
#インプットメソッドの設定
ibus-setup
#
#FINISH
echo "
=-------------=
| F I N I S H |
=-------------="
rm setupIbus.sh