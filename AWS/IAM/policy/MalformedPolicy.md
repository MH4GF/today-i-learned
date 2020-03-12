# putting S3 policy: MalformedPolicy: Invalid principal in policy がでた


```
Error: Error putting S3 policy: MalformedPolicy: Invalid principal in policy
	status code: 400, request id: F87ACB2332AFADD3, host id: 2M4agV2lxEJy4UByy5RmBuFk56PIlqNokGD1P03wjBbsL4uuMB8s+3QNdqzMcuzujPTs0OpZiXk=
```

```hcl-terraform
data "aws_iam_policy_document" "this" {
  // timee-rails-apiのfargateロールに書き込みを許可する
  statement {
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${var.AWS_ACCOUNT_TIMEE_JP_PROD}:role/example_role",
      ]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::<BUCKET_NAME>/*"
    ]
  }
}

```
## 解決

存在しないiam_roleを設定しているのが問題だった。
