# アプリケーション名
 B忘６（備忘録アプリ）

# アプリケーション概要
リカレント教育の重要性を勘案し、人材教育を図る目的を叶える為に動画投稿機能や質問・回答機能を備えました。
又、検索機能が備わっている為、個人の備忘録として活用することも可能です。

# URL
https://study-chat2.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード： admin

・Basic認証ID：2222

・メールアドレス：sample1@sample.com

・パスワード：abc111

# 利用方法
## 投稿機能
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う

2.新規投稿ボタンから投稿の内容（タイトル・投稿内容・投稿者名・※動画投稿は空欄でも可）を入力し投稿する

3.チャットとしての機能はもちろん、動画教材を投稿することで学習の場として活用できる。

## 回答機能
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う

2.一覧ページより興味を持った投稿及び質問事項に対して、回答（テキスト・投稿者名）する

3.goodボタンを備えており、興味を持った投稿に対して反応を示すことができる。

# アプリケーションを作成した背景
アプリケーションを作成した背景には主に２つの理由があります。
１点目は、業務を引き継ぐ際に、分厚いテキストのみの引き継ぎ書よりかは、
困った時にキーワードを検索することで回答を得られる備忘録兼引き継ぎ書があれば便利だと感じた為です。
２点目は、学生時代に学校の授業を何度でも復習できる環境があればなと感じていた為です。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1QorerAMYDXTStOpVg4rJEjVuOLfUdY2RbP-W6Wi0sX0/edit#gid=982722306


# 実装した機能についての画像やGIF及びその説明
・新規登録
[![Image from Gyazo](https://i.gyazo.com/dea542fd450f5505d5ef7cebce629ea8.gif)](https://gyazo.com/dea542fd450f5505d5ef7cebce629ea8)
・ログイン機能
[![Image from Gyazo](https://i.gyazo.com/9759120f7587bb3663841df9872e7d41.gif)](https://gyazo.com/9759120f7587bb3663841df9872e7d41)
・投稿機能
（※youtubeについては埋め込み用コードを使用しております。）
[![Image from Gyazo](https://i.gyazo.com/1c80665ae6fbe5c140809295ab893f30.gif)](https://gyazo.com/1c80665ae6fbe5c140809295ab893f30)

・回答機能
[![Image from Gyazo](https://i.gyazo.com/70a78757bb19a8d08251734583bc29fa.gif)](https://gyazo.com/70a78757bb19a8d08251734583bc29fa)

・検索機能
[![Image from Gyazo](https://i.gyazo.com/581bc7896336c05ced4603c4da3bb9c3.gif)](https://gyazo.com/581bc7896336c05ced4603c4da3bb9c3)

・いいね機能
[![Image from Gyazo](https://i.gyazo.com/aae9cbdb3eac07d09bb63b5336860faf.gif)](https://gyazo.com/aae9cbdb3eac07d09bb63b5336860faf)

・編集機能
[![Image from Gyazo](https://i.gyazo.com/cc7b432e711b77acb79bef15d3013817.gif)](https://gyazo.com/cc7b432e711b77acb79bef15d3013817)

・削除機能
[![Image from Gyazo](https://i.gyazo.com/3691fc0834e0d1a4b683cd5b812f85b6.gif)](https://gyazo.com/3691fc0834e0d1a4b683cd5b812f85b6)

# 実装予定の機能
今後は投稿内容をカテゴリー別に管理・検索し、保存できる機能を実装予定。
又、いいねの数によってランキング表示できるようにしたい。


# DB 設計
[![Image from Gyazo](https://i.gyazo.com/8ecbe63294bcb468b930d8c9bf82fd31.png)](https://gyazo.com/8ecbe63294bcb468b930d8c9bf82fd31)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/a40122d09b9ef39222cf27cf437c509a.png)](https://gyazo.com/a40122d09b9ef39222cf27cf437c509a)

# 開発環境
・フロントエンド

・バックエンド

・インフラ

・テキスト

・テキストエディタ

# ローカルでの動作方法
以下のコマンドを順に実行

% git clone https://github.com/study_chat2

% cd study_chat2

% bundle install

% yarn install

