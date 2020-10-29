# 結ぶ（むすぶ）
https://musubuu.com/

既存ユーザー・店舗のログイン

メールアドレス：1@1

パスワード：qazwsx

footerよりメールアドレスとパスワードを入力せずにゲストログインできます。

※メールアドレスの変更はお控えいただければ幸いです。


## サイト概要
飲食店経営者と店舗経営をしたい（個人,企業）のマッチングプラットフォーム。

- 店舗一覧
![店舗一覧](https://user-images.githubusercontent.com/59648368/94983083-83c7f200-057a-11eb-8d06-9aa23e21e0d2.png)
- 店舗詳細
![店舗詳細](https://user-images.githubusercontent.com/59648368/94983089-87f40f80-057a-11eb-9275-06ae2eb8dc0c.png)
- リアルタイムチャット
![チャット](https://user-images.githubusercontent.com/59648368/96331926-1f3d8480-109c-11eb-9455-01289f2d4328.png)
- ビデオチャット
![ビデオチャット](https://user-images.githubusercontent.com/59648368/96243777-2d2dcf80-0fe0-11eb-9d38-3cd77c6eae4b.jpg)
- 予約メール配信
![予約メール配信](https://user-images.githubusercontent.com/59648368/97573921-cf60a500-1a2d-11eb-9002-4c9ed4478d07.png)


### サイトテーマ
後継者不足に悩む飲食店経営者の方と自分のお店を持ちたい個人の方や飲食店を運営したい企業さんを「結ぶ」。

飲食店
後継者
M&A
思い出
マッチング
譲渡

### テーマを選んだ理由
昨今高齢化や後継者不足が原因で閉店するお店の話を聞くが、
実際に行く地元のお店の方々もお年を召している方が多く、
閉店してしまったら残念だと思いました。

また、ある中華屋（ラーメン屋）が閉店する際、常連だった知人が頼み込んでその味と看板を継ぎ、
今では全国的に有名なラーメン屋となっています。

上記のよう消えて欲しくない味やお店を守る何かのきっかけになればと思います。

### ターゲットユーザ
飲食店経営者
飲食店経営希望者（個人、または企業）

### 主な利用シーン
飲食店の譲渡

### 機能一覧
- ユーザーや店舗、管理者（ログインのみ）の登録、ログイン機能(devise)
- Google認証（複数モデル）
- 画像管理(refile)
- 地図表示（GoogleMapAPI）
- フォロー機能(Ajax)
- チャット機能(Action Cable）
- ビデオ通話機能(SkayWay)
- ページネーション機能(kaminari）
- 複数条件検索機能(ransack未使用)
- カテゴリ作成（ぐるなびAPI）
- バッチ処理
    - ぐるなびAPIを叩いて定期的にカテゴリ更新する
    - 未読通知3件以上の場合、メール通知する
    - 予約された時刻にメールを配信する
- CSV出力(検索結果も対応)
- 通知機能（フォロー、DM受信の際に通知）
- 予約メール配信機能(対象モデル、メール形式、時間の指定が可能）


[詳細はこちら](https://docs.google.com/spreadsheets/d/1lmwajsESFuNPbFwBXMTSVjh6C8d50j1PClmK3fSbwSs/edit?usp=sharing)

### 各種設計
- [ER図](https://drive.google.com/file/d/1plkLw5cj3sMJiV1y1R3QZvYrSiUya2mN/view?usp=sharing)
- [テーブル定義](https://drive.google.com/file/d/1Rdjfk6PzsaxTycq3DeyiGYXFabcoZqnU/view?usp=sharing)
- [詳細設計](https://docs.google.com/spreadsheets/d/14ZGLn75VAoGgxCy_y-yxxbSmJ99ZkNlCJRu6S0YxU2c/edit?usp=sharing)

### AWS構成
![構成図](https://user-images.githubusercontent.com/59648368/95850288-8fda5d80-0d8b-11eb-820d-93149ba9cd38.png)
- [設計書](https://docs.google.com/spreadsheets/d/1sndoUzbd2iC1l_Ww0eE6XKP9LDn7fb3-DtfEEmapJEA/edit?usp=sharing)

### テスト（RSpec）
- 単体テスト(model：User,Shop)　カバレッジ70%以上
- 機能テスト(request)　論理削除のログインや他ユーザーの編集防止など

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- 仮想環境：Vagrant,VirtualBox
- 外部API ぐるなびAPI,GoogleMapAPI
