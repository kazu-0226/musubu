# 結ぶ（むすぶ）
https://musubuu.com/

既存ユーザー・店舗のログイン

メールアドレス：1@1

パスワード：qazwsx

footerよりメールアドレスとパスワードを入力せずにゲストログインできます。

※メールアドレスの変更はお控えいただければ幸いです。


## サイト概要
飲食店経営者と店舗経営をしたい（個人,企業）のマッチングプラットフォーム。

![店舗一覧](https://user-images.githubusercontent.com/59648368/94983083-83c7f200-057a-11eb-8d06-9aa23e21e0d2.png)
![店舗詳細](https://user-images.githubusercontent.com/59648368/94983089-87f40f80-057a-11eb-9275-06ae2eb8dc0c.png)
![チャット](https://user-images.githubusercontent.com/59648368/94983090-89bdd300-057a-11eb-9bf5-a5eb3437c776.png)
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
- ページネーション機能(kaminari）
- 検索機能(ransack未使用)
- カテゴリ作成（ぐるなびAPI）
- バッチ処理（カテゴリ更新）
- CSV出力(検索結果も対応)

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
