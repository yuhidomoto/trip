# くわしめとりっぷ
[サイトはこちら](http://52.194.191.103/)

## 概要
どの国へ行こうか悩んでいる人のために、ガイドブックを手に取る前に様々な国の情報を提供し、旅行先を選ぶ手助けになれたらという思いを込めて作った旅行口コミ投稿サイトです。<br> 会員登録後、ユーザーは旅行の思い出を投稿し、他のユーザーの投稿を見ることができます。

![概要](/app/assets/images/readme-about2.jpg)

## バージョン

- ruby 2.5.7
- Rails 5.2.4.1
- bootstrap : 3.4.1

## くわしめとりっぷの魅力
### 1, 一目で旅行先の情報を得られる
旅行先に紐づいた情報が一画面に掲載。既存の情報と投稿者の情報を一画面に集めました。

### 2, 実際に現地行った人からの情報を得られる
友達から得た情報がガイドブックの情報よりも当たっていたことから、実際に現地へ行った人の声を取り入れようと考えました。

### 3, ガイドブックに載っていない情報を載せる
ガイドブックに載っていないような情報を載せ、このサイトなら知ることができるという旅行雑誌との差別化を図りました。

## 機能
- 会員登録
- 新規投稿、投稿編集機能
- 投稿の詳細
- 投稿一覧表示
- 検索機能
- コメント機能
- いいね機能
- Google Map機能

## デモ
いくつかの機能をピックアップして紹介します。

### 投稿一覧表示
投稿が5つのジャンル（大陸）に自動的に振り分けられます。
投稿一覧ページには、ジャンルごとに3つまで表示し、「もっと見るページ」にジャンル内の投稿を一覧表示することによって、ユーザーが見やすいように作成しました。
![投稿](https://user-images.githubusercontent.com/59519897/80300340-c5d45700-87d6-11ea-9d26-689f15da7d5b.gif)


### 検索機能
あいまい検索によって、検索ワードに関連する投稿を全て洗い出すようにしました。
![検索](https://user-images.githubusercontent.com/59519897/80299440-573fcb00-87cf-11ea-883c-efa4e95e7661.gif)

### Google Map機能
国名を投稿することにより、該当の国の日本語名、通貨、緯度、経度などが表示されます。
その緯度、経度により、国の位置をGoogle Mapにて表示されます。
![api](https://user-images.githubusercontent.com/59519897/80299819-5d837680-87d2-11ea-874f-f07c1c9478ea.gif)

## 最後に
ご覧いただき、ありがとうございます。<br>
「マレーシア ペナン島の海が汚かった」、「台湾 九份は人が多くて身動きが取れなかった」 これらの経験から、良い情報も悪い情報も、旅行先を決める前に知ることができていたらという思いからこのサイトを作りました。 <br>
初めてのアプリケーション開発のため、至らないところばかりだと思いますが、少しでも私の思いが伝われば幸いです。<br>
<br>
作成者：[Yuhi Domoto](https://github.com/yuhidomoto)
