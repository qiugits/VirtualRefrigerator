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
ローカルで編集するには、`git clone`して、以下のコマンドでdockerをセットアップする。これは最初の1回のみやればいい。最後にブラウザを立ち上げて動作を確認すること。

```terminal
$ git clone https://github.com/qiugits/VirtualRefrigerator.git
$ cd VirtualRefrigerator/
$ docker-compose build
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
$ docker-compose up
```

## 編集を加える
番号が付いているのは順番を踏むべきもの。
ドットは適宜使用する。

1. 編集を加える前にまずブランチをきる。

```terminal
$ git checkout -b any_branch_name
```

- 現在のブランチを確かめるには次のコマンドで`*`がついてるところを見る。
masterブランチを編集してはいけなくて、必ず`checkout -b`で作ったブランチを編集すること。

```terminal
$ git branch
```

- 編集を加えた後、どこに編集を行ったかを確かめるには次のコマンド

```terminal
$ git status
```

2. 編集したものをコミットしてプッシュするには次のようにする
```terminal
$ git add .
$ git commit -m '加えた編集について一行程度の簡潔な説明'
$ git push
```

3. masterに変更が行われたら、その変更をローカルに反映する
masterへのマージは基本的には@qiugitsが行う

```terminal
$ git fetch
$ git merge FETCH_HEAD
```
その後1.に戻るというサイクル


