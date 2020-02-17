# HMAC

- MAC(メッセージ認証符号)の一つ。
  - MAC ... 共通鍵を使ってメッセージを認証する短いコード。メッセージ改ざん防止の為に利用する。
- HMACはハッシュ関数で秘密鍵とメッセージをハッシュ化する。
  - 今回はHTTPリクエストが正規サーバーから送信されていることを証明するために利用した。
- MD5 や SHA-1 などの反復暗号ハッシュ関数を使う。
  - それぞれHMAC-MD5, HMAC-SHA1などと呼ばれる。
- MAC及びHMACで署名したメッセージは、送信者が作成し送信したという保証ができるわけではない。受信者側も同じ鍵を持っているので、受信者側でも署名を行うことができるため。
  
Goだとこんな感じで書ける。

```
func MakeHMAC(msg, key string) string {
    mac := hmac.New(sha256.New, []byte(key))
    mac.Write([]byte(msg))
    return hex.EncodeToString(mac.Sum(nil))
}
```

https://cipepser.hatenablog.com/entry/2017/05/27/100516

今回はHTTPリクエストヘッダーで署名を送ったため、HMACで署名したダイジェスト値をBase64でエンコードまでした。
