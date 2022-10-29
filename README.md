# Nagano_Cake

DMMWEBCAMP9月生チームBによるチーム開発で作成したECサイトです。

# 概要

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

![スクリーンショット (31)](https://user-images.githubusercontent.com/111563330/198768390-330d84c4-ecb8-4109-bc21-ecfdc25b2b1e.png)


# 案件の背景

元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るよう
になった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、菅
理機能を含んだ通販サイトを開設しようと思い至った。

# アプリケーションの設計

 [テーブル定義書](https://docs.google.com/spreadsheets/d/1clKM3BiSynZQx7-yV61K7hVK2t98pMUC/edit#gid=1243549839)
 
 [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/15yt2BE6V9NIviBsDipDjAddGOuDTzTra4UhD49EXVWI/edit#gid=549108681)

# 開発概要

## 開発環境

・Cloud9（AWS）

## バックエンド

・Ruby　3.1．2
・Rails　6.1．7
・SQLite3

## フロントエンド

・HTML
・SCSS

## gem
・devise
・bootstrap
・enum_help
・font-awesome-rails
・kaminari,~> 1.2.1
・rails-i18n

## ER図
![チームかき鍋マンER図 drawio](https://user-images.githubusercontent.com/111489156/198765327-d94c74da-6675-44fc-a752-c703988558af.png)

## 管理者用アカウント

- mail : admin@test.com
- password : password

※ $ rails db:seed を実行後、ログイン可能です。  

※管理者用アカウントを変更したい方は、db/seeds.rb内に設定してあるemailとpasswordのコードを変更してください。   
rails db:seed を実行後変更完了。
