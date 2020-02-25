# Docker Network

## 役割

- 立ち上げた複数のコンテナ同士の名前解決のために使用するのがdocker network
- 例えばrailsが動いている `app` コンテナは、 DATABASE_HOSTとして `db` を指定することでDBコンテナに接続することができる

## ネットワークの作成

- `docker network create hogehoge` でhogehogeネットワークを作成できる
- docker-compose upで勝手にデフォルトのnetworkが作成され、立ち上げたコンテナたちは同じnetworkに所属することになる

## 所感

- 複数のネットワークを管理したいとかがなければ、デフォルトで作成されるnetworkのままで良い気がしている
