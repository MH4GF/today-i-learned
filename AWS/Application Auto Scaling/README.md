# 概要
オートスケールを司る独立したAWSリソース。以下のリソースに対して自動スケーリングを設定できる。
- ECSサービス
- DynamoDBテーブル
- Auroraレプリカ
- Lambda関数
- GitHubリポジトリをもとに提供されるカスタムリソース

# できること
自身で定義する条件に応じてスケーリングできる。

- ターゲット追跡スケーリング ... ターゲットのキャパシティ(CPU,メモリなど)のCloudWatchメトリクスの閾値によってスケーリング
- ステップスケーリング ... ターゲットのキャパシティも含めた、より高度な閾値によってスケーリング
- スケジュールスケーリング ... 日時と時刻によってスケーリング
  
# AWSコンソール
各サービスに内包されている  
ex) ECS → クラスター → サービス → Auto Scaling 
 
# AWS CLI
https://docs.aws.amazon.com/autoscaling/application/APIReference/Welcome.html
 
# Terraform
 
## オートスケールしたいターゲット  
https://www.terraform.io/docs/providers/aws/r/appautoscaling_target.html

maxとminを指定する

## ポリシー
https://www.terraform.io/docs/providers/aws/r/appautoscaling_policy.html

ターゲット追跡スケーリング、ステップスケーリング両方ポリシーで行う。
