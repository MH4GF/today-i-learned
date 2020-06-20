# Cloud IAM

> Cloud IAM では、リソースに対するアクセス権を直接エンドユーザーに付与することはありません。複数の権限を役割にまとめて、認証されたメンバーに付与します。

- Member(GoogleAccount/ServiceAccount/GoogleGroup/GSuiteDomain)
- Role
- Policy

メンバーと役割があり、それをポリシーが紐付ける形

## サービスアカウント

- エンドユーザーではなくアプリケーションのアカウント
- 例）Compute Engineに付与したサービスアカウントで、Compute Engineの権限を制御する

