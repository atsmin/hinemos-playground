# hinemos-playground

このリポジトリはとりあえず簡単にHinemosを触ってみたい方向けの非公式リポジトリです。

Dockerを使って[Hinemosスタートアップ](https://www.hinemos.info/technology)の環境を動かしてみることができます。

※使用しているDocker Imageは公式のものではありません。

<p align="center">
  <img src="https://raw.githubusercontent.com/atsmin/hinemos-playground/master/demo.gif" width="800">
</p>

## Usage

* コマンド

```
git clone https://github.com/atsmin/hinemos-playground.git
cd hinemos-playground
docker-compose up -d    # 起動
docker-compose down     # 停止
docker-compose down -v  # 停止(設定も削除)
```

* ログイン
```
1. ブラウザでhttp://localhostにアクセス
2. 接続先URLをhttp://manager:8080/HinemosWS/に変更
3. パスワードに"hinemos"と入力しログイン
```

* IPアドレス

```
1. マネージャ  　  : 172.31.1.10
2. エージェント    : 172.31.1.11
3. Webクライアント : 172.31.1.12
```

## Play with Docker

Dockerがインストールされていない場合でも、以下のボタンからブラウザ上で試してみることができます。

[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/atsmin/hinemos-playground/master/docker-compose.yml)

## Tips

* エージェントコンテナを停止
```
docker container stop hinemos-agent
```

* エージェントコンテナを再開
```
docker container start hinemos-agent
```

* エージェントコンテナでコマンドを実行

```
docker container exec -it hinemos-agent bash
# CPU負荷をかける
$ yes > /dev/null
# syslogをマネージャに送信
$ logger ERROR
```
## Build

* Dockerfile
```
1. マネージャ  　  : manager/Dockerfile
2. エージェント    : agent/Dockerfile
3. Webクライアント : web/Dockerfile
```

* Dockerfileを変更し、イメージをビルド

```
# docker-compose.ymlを以下のように変更します
...
        build:
            context: .
            dockerfile: manager/Dockerfile
        image: hinemos-manager
        # image: aminami1127/hinemos-manager
...
```
```
# イメージをビルドして起動
docker-compose up -d --build
```

