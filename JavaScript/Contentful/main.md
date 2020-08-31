# Contentful

## JavaScript SDK

- https://www.contentful.com/developers/docs/javascript/tutorials/using-js-cda-sdk/

## Next.js等でSSGしている場合、記事を更新した際に再ビルドが必要？

→ 必要。  
Vercelの場合、URLを叩いてビルド・デプロイするDeploy Hookが用意されている  
DashboardのSettings → Git Integration → Deploy Hooks から設定する  
名前とブランチ名を設定しURLを得る  
[Deploy Hooks](https://vercel.com/docs/more/deploy-hooks)  
  
続いてContentful側でWebHookを指定する。  
Vercelとの連携が公式でサポートされていた。  
[Webhooks](https://www.contentful.com/developers/docs/concepts/webhooks/)
