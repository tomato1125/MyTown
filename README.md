# アプリ名

## My Town

# ロゴ

![myTown4](https://user-images.githubusercontent.com/66346042/96842708-550daf00-1488-11eb-8193-0f316418a9dc.jpg)

# アプリについて

「My Town」はあなたの地元や今住んでいる場所の好きなところを共有する投稿サイトです。

# 本番環境

## URL: https://my-town.work/

- ※ヘッダーの「ゲストログイン」より簡易ログインが可能です。お試しいただけますと幸いです。

## 主な機能

- ユーザーは画像（最大５枚）、コメントをつけて投稿ができます。
- 投稿時、「都道府県」、「カテゴリー」を選ぶことができ、その情報を基に投稿が分類分けされます。
- 投稿時、マップに地名を入力し検索することで共有したい場所の位置情報を確認でき、登録地名を入力することができます。
- 登録した情報は各投稿の詳細にて確認することが可能です。
- 他ユーザーの投稿を Bookmark することができます。Bookmark したものはマイページにて確認ができます。
- 気に入った投稿を SNS（Twitter,Facebook,LINE)でシェアができます。
- ユーザー間でダイレクトメッセージにてやりとりができます。（マイページからダイレクトメッセージを送れます。）
- 通知機能を搭載しており、フォローしているユーザーが自身をフォロー、ダイレクトメッセージ送信、投稿へのコメントを行った時に通知を読むことができます。
- レスポンシブ対応です。iphone サイズだとヘッダーメニューがハンバーガーメニューに切り替わります。

![MyTown_gif2](https://user-images.githubusercontent.com/66346042/96846885-71601a80-148d-11eb-824f-32dd5a887efa.gif)
![MyTown_gif3](https://user-images.githubusercontent.com/66346042/96847502-3a3e3900-148e-11eb-8f6d-f09578e350bf.gif)
![MyTown_gif1](https://user-images.githubusercontent.com/66346042/96845397-9fdcf600-148b-11eb-971a-0986be09394e.gif)

## 投稿検索機能

- 投稿した情報は文字列検索、カテゴリー別検索、県別検索が可能です。

![jpg1](https://user-images.githubusercontent.com/66346042/89242296-2c6dda00-d63c-11ea-9e31-b430dd97fa27.jpg)
![gif4](https://user-images.githubusercontent.com/66346042/89202005-492ef100-d5ed-11ea-828b-e6f27bbad314.gif)
![gif5](https://user-images.githubusercontent.com/66346042/89202466-f43faa80-d5ed-11ea-9fde-124288e6bddd.gif)

# 作成した経緯

私の地元は長崎県で、地元のことは好きなのですが、地元のことを質問された時、意外と知らないことが多いなと感じることがよくあります。
日常の些細なことや個人的な好みなどを投稿できるサイトを作ることで、地元に関する多角的な情報を一度に収集でき、より理解が深まると
感じて作成しました。

また、昨今コロナウイルス等の影響もあり、リモートワークが全国的に広まっている現状があります。長年、東京一極集中問題が取り沙汰されて
おりますが、今後リモートワーク等含め、住む場所に拘らず様々な場所で仕事ができる環境が整っていくのではないかと感じております。
そういった時に地方の良いところに目を向けて、その地域に来てもらう手段としてこのアプリを使って欲しいと感じております。

現時点では実装しておりませんが、アプリ内に求人情報などを投稿できるフォームを作成して、より地域貢献できるようなアプリ開発を目指して
おります。

# 工夫したところ

ユーザーがより直感的にアプリを使ってもらえるように表示はできるだけシンプルにし、必要な情報を必要最低限表示できるように実装しました。

# 作成時の課題とそれをどのように解決したか

作成時の課題はエラー解決を行う上で問題箇所の特定を把握することでした。作成初期段階はエラー出現時、エラーを解決するまでにかなりの時間を要しました。原因はエラー文やエラーログを細かく見れていなかったためです。作成を進める中でエラーが出現した際は、エラー文やエラーログを徹底的に確認することに注力しました。エラー文やログには問題を解決するためのヒントが記載されていることがほとんどなので、エラー文を基に検索を行ったり、自分の中で仮説を立てて解決を試みるうちに以前よりもエラー解決がスムーズにできるようになったと実感しております。エラー文を基に問題を分解・抽出し、各問題に対してどのような対処が有効かを考えることが重要だと感じております。

# 開発環境

Ruby/Ruby on Rails/JavaScript/jQuery/Haml/Sass/MySQL/Github/AWS/Route53/Visual Studio Code

- ruby '2.6.5'
- ruby on rails '6.0.0'
- gem 'devise'
- gem 'mini_magick'
- gem 'carrierwave'
- gem 'geocoder'
- gem 'seed-fu'
- gem 'kaminari'
- gem 'dotenv-rails'
- gem "gon"
- gem 'fog-aws'

テスト

- gem 'rspec-rails', '~> 4.0.0.beta2'
- gem 'factory_bot_rails'

![MyTown_skill](https://user-images.githubusercontent.com/66346042/96840526-8638b000-1485-11eb-8c12-8b10fbd33a51.png)

# 今後実装したい機能

- 絞り込み検索機能の拡充
- バリデーションの設定・テストコードの記述

# ER 図

![MyTown_ER](https://user-images.githubusercontent.com/66346042/96838608-0b6e9580-1483-11eb-8ba1-efea70d1b600.png)
