# Certbot Get Wild(card)
Google Domains + Google Cloud DNS で Let's Encrypt のワイルドカード証明書を取得する

## 準備
* Google Cloud DNS
  * DNS を操作できるサービスアカウントを作成し、認証鍵のjsonを ./conf 以下に配置
  * 任意のゾーン名で DNS名が `_acme-challenge.example.jp` のゾーンを作成
  * レジストラの設定からネームサーバーを確認しておく
* Google Domains
  * `_acme-challenge.example.jp` のNSレコードを作成し、Cloud DNS で確認したネームサーバーを設定
* certbot.envを作成し以下を記入
  * SERVICE_ACCOUNT_JSONFILE=認証鍵のjsonのファイル名
  * TARGET_DOMAIN=ワイルドカード証明書を発行するドメイン名(example.jp)
  * EMAIL=Let's Encrypt に登録するメールアドレス
  * ZONE_NAME=CloudDNSのゾーン名

## 使い方
* 新規発行時
  * `docker-compose run certbot new`
* 更新時
  * `dcker-compose up`
  * 自動化推奨
* どちらの場合も ./cert 以下に最新の証明書がコピーされる