#!/bin/bash

## apt を使うときはまずはパッケージリストのアップデートから
apt update

## nを入れたいので nodejs npm をパッケージから入れます。
apt install -y nodejs npm

## n をnpmからインストール
npm install n -g

## 最新安定版の nodejs, npmをインストール
n stable

## aptで入れたパッケージは使わないのでアンインストール
apt purge -y nodejs npm
apt autoremove -y
