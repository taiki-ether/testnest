#!/bin/sh

## npmパッケージのインストール 基本的に nodeのアプリケーションはこれだけで準備が整う。(すごい) 
npm i

## systemdを使ったサービスとして管理。再起動・起動状況の確認が容易になる。
cp  ./nestapi-ether.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable nestapi-ether --now

## アクセス制御などを柔軟に行うため、Nginxを導入
apt install nginx -y

## Nginx用の設定ファイルを適用 (後で一緒に見ましょう) 
cp -ip /opt/testnest/nestapi-ether.com /etc/nginx/sites-available/
ln -nfs /etc/nginx/sites-available/nestapi-ether.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

## 設定チェックをして起動
#nginx -t
systemctl restart nginx
