# install "Sane Utils" & "Scan Snap S300 Driver"
USERNAME=$(whoami)
sudo apt install sane-utils -y
sudo usermod -a -G scanner ${USERNAME}
sudo mkdir -p /usr/share/sane/epjitsu/
sudo wget https://raw.githubusercontent.com/stevleibelt/scansnap-firmware/master/300_0C00.nal -O /usr/share/sane/epjitsu/300_0C00.nal
sudo echo 'ATTRS{idVendor}=="04c5", ATTRS{idProduct}=="1156", MODE="0664", GROUP="scanner", ENV{libsane_matched}="yes"' | sudo tee  /etc/udev/rules.d/49-sane-missing-scanner.rules
# install "Scanbd"
sudo apt install scanbd -y
sudo cp /etc/scanbd/scanbd.conf /etc/scanbd/scanbd.conf2
cat /etc/scanbd/scanbd.conf | sed s/"debug-level = 2"/"debug-level = 3"/ | sed s/"user".*"= saned"/"user = ${USERNAME}"/ | sed s/"script = \"test.script\""/"script = \"scan.sh\""/ | sudo tee /etc/scanbd/scanbd.conf
# create "scan.sh" that works when you press a physical button
sudo mkdir /etc/scanbd/scripts/
echo "#!/bin/sh
SCANFILE=scanImage\`date \"+%Y%m%d%H%M%S\"\`.pnm
scanimage > /home/${USERNAME}/\${SCANFILE}
" | sudo tee /etc/scanbd/scripts/scan.sh
sudo chmod a+x /etc/scanbd/scripts/scan.sh
# set deamon
sudo systemctl daemon-reload
sudo service scanbd start
sudo update-rc.d scanbd enable
