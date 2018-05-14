Virtual Regrigerator - バーチャル冷蔵庫
=======================================
**システム　グループ6**

# 開発環境
## 前提
Docker, Git, GitHub
### Docker
サーバ（160.16.235.25）にはDocker導入済み
サーバではなく手元PCを使う場合は[https://www.docker.com/community-edition](https://www.docker.com/community-edition)よりダウンロードする

### Git
Gitの入れ方は雑にググればOK（たぶん）

### GitHub
コマンドラインから`git push`でプッシュするにはSSH public keyをGitHubのSettings > SSH and GPG keysで登録すると良い。[https://qiita.com/shizuma/items/2b2f873a0034839e47ce](https://qiita.com/shizuma/items/2b2f873a0034839e47ce)とか、雑にググっても良い。

## `git clone`

```terminal
$ git clone https://github.com/qiugits/VirtualRefrigerator.git
$ cd VirtualRefrigerator/
$ docker-compose build
$ docker-compose run web rails db:create
$ docker-compose up
```


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
