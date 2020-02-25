# chromedriverをインストールしたRailsのDocker環境

RSpecのFeatureSpecのためにchromedriverが必要だが、docker環境で実行するのは結構しんどかったのでまとめる。

## 環境

```sh
ruby: 2.7.0
rails: 6.0.1.2
postgresql: 12.2
chromedriver: 80.0.3987.106
```

## TL;DR

1. chromeのインストール(署名が必要)
2. 依存ライブラリのインストール
3. インストールしたchromeのバージョンに合わせたchromedriverをインストール
4. rails_helper.rbにchromedriverの実行時オプションを追加

この4ステップが必要だった。  
rails_helperのoptionはこんな感じ  

```ruby
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome, screen_size: [1920, 1080],
                         options: { args: %w[headless disable-gpu no-sandbox disable-dev-shm-usage] }
  end
```

## 何をやってるか

Docker環境は基本的にrootユーザーであり、rootでchromedriverを動かすためにはno-sandboxオプションが必要となる。  
<https://developers.google.com/web/updates/2017/04/headless-chrome?hl=ja>  
  
解決策としては以下の2つがある

- Dockerfileでユーザーとグループを作成し、一般ユーザーで動かす
- rails_helperにオプションを追加する

Docker環境でのみ必要なオプションをrailsに追加するのは悲しいため、最初はDockerfileでやる方針でやっていた。  
しかし一般ユーザーに降格すると所々でsudoが必要になりつらい。ローカル環境のrspecでも動作確認をしオプションを追加しても問題なく動くことを確認できているため、塩梅を取って今回はrails_helperを修正する形を取った。  
