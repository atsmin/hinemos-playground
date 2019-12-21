# hinemos-docker

このリポジトリはとりあえず簡単にHinemosを触ってみたい方向けの非公式リポジトリです。

Dockerを使って[スタートアップ手順](https://www.hinemos.info/technology/nttdata/2018040301)の環境を動かしてみることができます。

## Demo

<p align="center">
  <img src="https://raw.githubusercontent.com/atsmin/hinemos-docker/master/demo/demo.gif" width="600">
</p>

## Usage

* コマンド

```
git clone https://github.com/atsmin/hinemos-docker.git
cd hinemos-docker
docker-compose up -d    # 起動
docker-compose down     # 停止
docker-compose down -v  # 停止(設定も削除)
```

* IPアドレス

```
1. マネージャ  　  : 172.31.1.10
2. エージェント    : 172.31.1.11
3. Webクライアント : 172.31.1.12
```

## Play with Docker

Dockerがインストールされていない場合でも、以下のボタンからブラウザ上で試してみることができます。

[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/atsmin/hinemos-docker/master/docker-compose.yml)

## Tips

* syslogをエージェントのコンテナからマネージャに送信する

```
docker container exec -it hinemos-agent logger ERROR
```
