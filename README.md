# C0FEE

コーヒーのロースター / 豆 / 淹れ方 を記録、共有できるアプリです。<br/>
どんなコーヒーがあるのか探してみましょう！<br/>

### https://c0fee.com （現在停止中）

<a href="https://c0fee.com/">
<img width="1436" alt="スクリーンショット 2020-08-08 22 20 48" src="https://user-images.githubusercontent.com/45422771/89711569-fd51c280-d9c5-11ea-86e7-e276df3c4338.png">
</a>

---
### 機能一覧
* ユーザー登録、ログイン  ( devise等 )
* CRUD✖︎4 
* 画像アップロード ( carrierwave, minimagick, piet, fog-aws ）
* お気に入り✖︎3 ( ajax )
* 検索
* 2か国語 (日/英) 対応（ I18n, I18n-js, globalize ）
* チャート （ chart-js-rails ）
* 地図表示 ( Google Map API, geocoder )
* お問い合わせ （ Action Mailer ）
* ページネーション ( kaminari )
* レスポンシブデザイン

---
### インフラ
* AWS
	* VPC
	* EC2
	* ECS(Fargate)
	* ECR
	* RDS
	* ALB
	* ACM
	* Route53
	* KMS
	* SSM
	* Kinesis Fire Hose
	* Cloud Watch Logs
	* S3
* Terraform
* CircleCI ( CI / CD )

---
### バックエンド
Ruby 2.6.3<br/>
Rails 5.2.3<br/>
PostgreSQL 11.0<br/>

---
### フロントエンド
Materialize.css

---
### 開発
VSCode<br/>
Docker Desktop for Mac<br/>
docker-compose<br/>

使用Image:<br/>
* ruby2.6.3
* postgres11.0-alpine

効率化Gems:<br/>
* Rubocop ( リンター )
* Hirb  ( オブジェクト表示 ) 
* Ridgepole ( マイグレーション )
* Enum ( 列挙型 ) 
* Lograge ( ログフォーマット )  など

バージョン管理:<br/>
* Git
* GitHub

---
### テスト
Ci上で自動化<br/>
結果をSlackに通知<br/>
* Rspec, Capybara, Faker, FactoryBot
* 単体テスト
* 統合テスト （ FeatureSpec ）
 
---
### デプロイ
テスト後ECSに自動デプロイ（deployブランチのみ）<br/>
ログはCloud Watch LogsからKinesis Data FirehoseでS3に定期保管<br/>
	
---
### Terraform
IAM Role, Security Groupをmodule化<br/>
tfstateはS3に保存<br/>
Fargateコンテナに入れないためdockerインストール済みのEC2を別途用意<br/>
  * version: 0.12.20
  * provider: aws 2.44.0

---
### ER図
![ER図](https://user-images.githubusercontent.com/45422771/89233939-bc545980-d625-11ea-8ea7-bec7a10d638b.png)

---
### クラウドアーキテクチャ
![AWS図](https://user-images.githubusercontent.com/45422771/89865679-21d9b480-dbe9-11ea-9ae1-925f04375e82.png)


### マイグレーション方法
`bundle exec ridgepole -c config/database.yml -f db/Schemafile --apply`