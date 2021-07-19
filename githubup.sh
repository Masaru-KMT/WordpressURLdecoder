#!/bin/bash
# WordpressURLdecoder
# Wordpressプラグイン『Simply Static』が出力する
# URLデコードしたファイルをGitHubにアップするbashスクリプト
# Version: 2021-07-18

message=$(date +"%Y-%m-%d %I:%M:%S")
#echo $message

# [変数設定]『Simply Static』が出力するzipファイルの解凍先ディレクトリ
workdir="/home/masaru/temp/"

# [変数設定]gitディレクトリ
gitdir="/home/masaru/Masaru-KMT.github.io/"

files="${workdir}*" 
cp -rf $files $gitdir
rm -rf $files 

cd $gitdir
git add $gitdir
git commit -m "${message}"
git push

