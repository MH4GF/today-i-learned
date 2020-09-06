# API Gatewayのもろもろ

## VPCリンク

API GatewayのバックエンドにはLambdaやHTTP, AWSリソースを指定できた
VPC Linksを使うことでVPC内のリソースをバックエンドに指定することができる。  
<https://dev.classmethod.jp/cloud/aws/aws-reinvent-apigateway-vpc-integration/>

## リソースポリシー

ブラックリスト, ホワイトリストなどでリソースのアクセスを制限できる。

### リソースポリシーの反映の方法

APIのデプロイが必要。  
エディタで変更 -> 保存 -> APIのデプロイ  
<https://aws.amazon.com/jp/premiumsupport/knowledge-center/api-gateway-resource-policy-whitelist/>

## terraform
 
### API

aws_api_gateway_rest_api
<https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html>
