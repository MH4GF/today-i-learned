# WAFとは

> WAF（Web アプリケーションファイアウォール）とは、Web アプリケーションの通信をフィルター、監視、ブロックするためのソフトウェアまたは、ハードウェアのセキュリティ対策です。

- cloudfrontとALBで動作する
- SaaSのため簡単に導入できすぐに始められてすぐやめられる

## 用語
### WebACL
ウェブアクセスコントロールリスト。

- リクエストの IP アドレスの送信元
- リクエストの送信元の国
- リクエストの一部に含まれる文字列一致または正規表現（regex）一致
- リクエストの特定の部分のサイズ
- 悪意のある SQL コードまたはスクリプトの検出

上記の任意の条件を組み合わせられる。

## リンク
AWS WAF https://aws.amazon.com/jp/waf/
terraform https://www.terraform.io/docs/providers/aws/r/waf_web_acl.html
WAF 再入門 https://dev.classmethod.jp/cloud/aws/aws-relearning2019-aws-waf/
