# setupChromebook
ChromebookにおけるLinuxモードの設定スクリプト

## スクリプトの説明
|ファイル名|説明|
|:--:|:--|
|setup.sh|**ChromebookのLinuxモードの初期設定を行うスクリプト**<br> - 日本語設定（Ibus）<br> - エディタ設定（Vim）<br> - プログラミング環境構築（Anaconda3）<br><br>詳しい使用方法は「[how_to_use_the_script.pdf](https://github.com/s-sasaki-gunma/setupChromebook/blob/main/how_to_use_the_script.pdf)」を参照|
|setupIbus.sh|機能別スクリプト：日本語設定（Ibus）|
|setupFcitx.sh|機能別スクリプト：日本語設定（Fcitx）|
|setupVim.sh|機能別スクリプト：エディタ設定（Vim）|
|setupAnaconda.sh|機能別スクリプト：プログラミング環境構築（Anaconda3）|

## 注意事項
- apt,wgetのコマンドを実行しているため、**ネットワーク接続を必要**とします。
- 教育関係者の方が授業で使う際は、教室のネットワーク帯域に応じてお使い下さい。<br>例えば、群馬県のGIGAスクール回線で40台同時に実行すると数台はAnaconda3のwget中にタイムアウトします。
- 利用する際はスクリプトの中身を確認してから**自己責任**のもとご利用下さい。
- 当スクリプトを用いたことにより生じたトラブル等について、**いかなる責任も負いかねます**ので、あらかじめご了承ください。
