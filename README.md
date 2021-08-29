## 🍀白門祭エコ容器オンラインショップ
![image](https://user-images.githubusercontent.com/69100635/131132242-93548c48-6832-49ff-9909-2033b4f4d442.png)

## 📙概要
中央大学白門祭で販売する「エコ容器」のECサイトです。<br>
「エコ容器」とは屋台等で使われる、リサイクル可能な食品容器のことです。<br>

## 📙制作背景
白門祭では毎年膨大な量のゴミが出ています。<br>
環境対策として、白門祭実行委員会では参加団体の方へ「エコ容器」を使用することを呼びかけていました。<br>
しかし、エコ容器は、大学構内でしか受付をしておらず、現金のみの販売となっています。<br>
そこで、参加団体の方が、もっと手軽にエコ容器を購入できるシステムを作りたいと考え、エコ容器オンラインショップの制作に至りました。

## 💡どんな問題を解決するのか？
白門祭に参加する飲食団体の方が、時間・場所を問わずエコ容器を購入できる

## 🌐URL
[エコ容器オンラインショップ(顧客ページ)](https://morning-eyrie-27166.herokuapp.com/)<br>
[エコ容器オンラインショップ(管理者ページ)](https://nameless-lowlands-21534.herokuapp.com/admin/sign_in)
　　　
## 👇テスト用アカウント
### 顧客ページ
email: 3222@example.com<br>
pass: Webexample
### 管理者ページ
email: sk2322@example.com<br>
pass: AdminTest

## 📙開発環境
- 言語：HTML/CSS,JavaScript,Ruby 2.6.3
- フレームワーク：Rails 5.2.6
- IDE：AWS Cloud9

## 📙機能一覧
### 顧客ページ
- ログイン機能
- ログアウト機能
- 商品一覧表示機能
- 商品詳細情報表示機能
- カート機能
- カート編集機能
- クレジットカードカード決済機能
- 注文完了メール配信機能
- 会員情報編集機能
- 退会機能
- 配送先追加・編集機能
- 注文履歴一覧表示機能
- 注文履歴詳細表示機能
- ジャンル検索機能

### 管理者ページ
- ログイン機能
- ログアウト機能
- 注文履歴一覧表示機能
- 注文履歴詳細表示機能
- 顧客一覧表示機能
- 顧客詳細情報表示機能
- 顧客情報編集機能
- 商品一覧表示機能
- 商品詳細情報表示機能
- 商品情報変更機能
- ジャンル設定機能
- 商品検索機能

## 📙工夫した点
### pay.jpのAPIを使ったクレジットカード決済
![image](https://user-images.githubusercontent.com/69100635/131134468-741e33a8-5159-4c8d-aab0-7ee0d6ddf0d9.png)
### 注文完了時のメール通知機能
<img src="https://user-images.githubusercontent.com/69100635/131238116-6df7120d-0999-4426-9079-f94dd51ba252.png" width="300px"><img src="https://user-images.githubusercontent.com/69100635/131238099-496a7694-c163-4afe-b16b-cc6bb970137d.png" width="300px">
### Amazon S3を利用したエコ容器画像アップロード
![image](https://user-images.githubusercontent.com/69100635/131240231-1052ba7c-4555-42a2-aea9-24329d82e611.png)



## インストール手順
1. リポジトリをコピーします。
```bash
$ git clone git@github.com:sk1318/eco_online_shop.git
```

2.作業用ディレクトリを移動します。
```bash
$ cd 2021_eco_online_shop
```

3. Gemをインストールします。
```bash
$ bundle install
```

4. テーブルを作成します。
```bash
$ rails db:migrate
```

5.サーバーを起動します。
```bash
$ rails s
```

## 開発者
新村康介
