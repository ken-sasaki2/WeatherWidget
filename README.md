## アプリの概要
`WidgetKit`で天気予報アプリを開発。  
現在時刻から24時間先までの気温、天気、気圧グラフが確認できる。

## 開発内容
言語：Swift  
フレームワーク：SwiftUI  
テスト：XCTest  
API：Open Weather One Call API  

## ウィジェット画面
![スクリーンショット 2022-02-22 17.49.45.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/643372/cc486bec-716f-0203-9763-634b2854c6a1.png)

## 苦労した箇所
気圧グラフの描画が最も苦労しました。特にy軸です。
### x軸
x軸は描画範囲を24分割してindexと積することで求めることができました。

### y軸
y軸はグラフ描画範囲を30で割った高さを1hpaあたりの高さとし、現在時刻の気圧に15を足した値を描画範囲の上限値としています。  
その上限値から各時間の気圧との差を求めて、1hpaあたりの高さと積すれば各時間の気圧グラフ描画ポイントのy軸が求められます。  
今回、気圧グラフ描画範囲の上限下限は現在時刻の気圧から15hpaに設定しました。

## 開発者
開発者への連絡は[Twitter DM](https://twitter.com/ken_sasaki2)までお願いします🙇‍♂️  

![QR_615427.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/643372/4f8dff15-33fa-c042-44a3-b592f49c959c.png)

↓活動リンクはこちら↓  
https://linktr.ee/sasaki.ken
