#!/bin/bash
# WordpressURLdecoder
# Wordpressプラグイン『Simply Static』が出力する
# URLエンコードされたフォルダ名を一括デコードするbashスクリプト
# Version: 2021-07-17

# Wordpressのデータはプラグイン『Simply Static』でダウンロードします
# https://ja.wordpress.org/plugins/simply-static/

# 【注意】別途nkfのインストールが必要です
# sudo apt install nkf
# (Ubuntuの場合)


#  [変数設定]スクリプトを格納・実行するディレクトリ
scrdir="/home/masaru/"

# [変数設定]『Simply Static』が出力するzipファイルの解凍先ディレクトリ
workdir="/home/masaru/temp/"


# ディレクトリ一覧の取得(dirlist.txtに格納)
dirlist="${scrdir}dirlist.txt"
find $workdir -type d > $dirlist

# ディレクトリ一覧を一行ずつ読み込みnkfでデコードしたファイル名に変更
cat ${dirlist}  | while read line
do
 newname=$(echo $line  |  nkf -w --url-input)
 echo "${line} -> ${newname}"
 mv $line $newname
done

