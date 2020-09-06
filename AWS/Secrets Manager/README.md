# AWS Secrets Manager

## 概要

- 機密情報の管理をかんたんにする
- ローテーション機能が実装されている(Aurora/RDS)
  - それ以外でも自前実装すればローテーションできる
- RDSのパスワード管理が主なユースケース

## 料金

- 1つのsecretsあたり0.40USD/月。
- 10000回のAPIコールあたり0.05USD。

めちゃめちゃ安い。がparameter storeがほぼ無料なのと比べると有料ではあるということだけ  
<https://aws.amazon.com/jp/secrets-manager/pricing/>

## チュートリアル

<https://docs.aws.amazon.com/ja_jp/secretsmanager/latest/userguide/tutorials_basic.html>

1つのsecretが複数のkey:valueを持つことができるっぽい。なるほど。

## awscliでのバイナリのアップロードとダウンロード

バイナリデータのアップロードは現状AWSコンソールではできず、awscliからのアップロードが必要。  

### アップロード

create-secretコマンドを使い、filebでファイルパスを指定してアップロードする。  
filebで指定することで、awscliが内部でbase64エンコードしてくれる
  
<https://docs.aws.amazon.com/cli/latest/reference/secretsmanager/create-secret.html>

```shell script
$ aws secretsmanager create-secret --name example --secret-binary fileb://~/tmp/example.pem
{
    "ARN": "arn:aws:secretsmanager:ap-northeast-1:xxxxxxxxxxxx:secret:example-xxxxxxx",
    "Name": "example",
    "VersionId": "xxxxxxxxxxxx"
}

```

アップロードができたらAWSコンソール上で確認できる  
が、AWSコンソールはバイナリの表示ができないので、 `シークレットの値` には何も表示されない  
  
バイナリデータの確認もコマンドで実行できる  
base64エンコードされていることがわかる  

```shell script
aws secretsmanager get-secret-value --secret-id example
{
    "ARN": "arn:aws:secretsmanager:ap-northeast-1:xxxxxxxxxxxx:secret:example-xxxxxxx",
    "Name": "example",
    "VersionId": "xxxxxxxxxxxx"
    "SecretBinary": "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQ0K  ~~ 省略 ~~ TUlJRXBBSUJBQUt=",
    "VersionStages": [
        "AWSCURRENT"
    ],
    "CreatedDate": "2020-03-12T13:48:33.681000+09:00"
}
```

### ダウンロード

上記でバイナリデータの確認で使用した `get-secret-value` コマンドを使ってファイルに書き出すことができる
base64コマンドで複合する  

<https://docs.aws.amazon.com/cli/latest/reference/secretsmanager/get-secret-value.html>

```shell script
aws secretsmanager get-secret-value --secret-id example --query 'SecretBinary' --output text | base64 -d > output.pem
```
