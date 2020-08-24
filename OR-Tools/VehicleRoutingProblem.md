# やりたいこと 

- 配送最適化問題を解きたい
- Chompyの配達ルート生成の自動化はOR-Toolsをカスタマイズして実現しているとのこと
  - https://note.com/zaq1tomo/n/nb47764f51a5e
  
## 使ってみる

https://developers.google.com/optimization/routing/vrp  
  
### データを用意する

- distance_matrix：デポと配達目標地点間の距離の配列（メートル単位）
  - 距離行列というらしい
- num_locations：配達目標地点の数
- num_vehicles：車両の数
- depot：distance_matrixの配列の中のデポ(配達開始地点)のindex(配列の一番最初なら0)

今回扱うデータが緯度経度の位置情報のため、distance_matrixを作らないといけない  
→ Google Distance Matrix APIを使う
