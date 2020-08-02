# README

コーヒーのロースター/豆/淹れ方を記録、共有できるアプリです。
転職活動のポートフォリオとして作成しました。<br/>
https://c0fee.com

# 機能一覧(gemなど)
* ユーザー登録、ログイン（device,omniauth,omniauth-google-oauth2）
* CRUD✖️4(ユーザー,店,豆,レシピ)
* 画像アップロード（carrierwave, minimagick, piet,fog-aws）
* お気に入り(ajax)
* ページネーション(kaminari)
* 検索
* 2か国語（日、英）対応（I18,I18n-js,globalize）
* チャート、グラフ（chart-js-rails）
* 地図表示(Google Map API,geocoder)
* レスポンシブデザイン

# 使用技術
* Ruby 2.6.3
* Ruby on Rails 5.2.3
* PostgreSQL 11.0
* Docker,docker-compose
* Ridgepole
* Materialize.css
* Rspec
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
* Git,GitHub
* Circleci, Orbs

# 開発
* Docker Desktop for Mac
* docker-compose
* イメージ: ruby2.6.3, postgres11.0-alpine

# テスト
Ci上で自動化<br/>
テスト結果をSlackに通知
* Rspec,Capybara,Faker,FactoryBot
* 単体テスト
* 統合テスト（featurespec）

# 本番
テスト後ECSに自動デプロイ（deployブランチのみ）<br/>
ログはCloudWatchLogsからKinesisfirehoseでS3に定期保管

# Terraform
* version: 0.12.20
* provider: aws 2.44.0
IAM Role,Security Groupはmodule化<br/>
tfstateは、S3に保存。<br/>
Fargateコンテナに入れないため別途dockerインストール済みのEC2を用意<br/>
