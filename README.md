# README
curl http://localhost:3000/startを実行して以下メッセージが表示されればOK
```
{"message":"WebPuzzleへようこそ。ユーザー登録をお願いします。エンドポイントはこちら。/users"}
```
curl http://localhost:3000/usersを実行して以下メッセージが表示されればOK
```
{"message":"HTTPメソッド、それであってる？。"}
```
curl -X POST http://localhost:3000/usersを実行して以下メッセージが表示されればOK
```
{"message":"伝え忘れてました。一応簡易的な認証機能をつけてます。AuthorizationヘッダーにBearerトークンを設定してください。トークンは本日の日付です。フォーマットはyyyy-mm-ddです。"}
```
curl -X POST -H "Authorization: Bearer 2024-01-18" http://localhost:3000/usersを実行して以下メッセージが表示されればOK
```
{"message":"トークン日付が違うよ"}
```
curl -X POST -H "Authorization: Bearer 2024-01-20" http://localhost:3000/usersを実行して以下メッセージが表示されればOK
```
{"message":"Name can't be blank"}
```
curl -X POST -H "Authorization: Bearer 2024-01-20" -d "name=fujisawa" http://localhost:3000/usersを実行して以下メッセージが表示されればOK
```
{"message":"ユーザーの仮登録が完了しました。本登録をするためにブラウザで http://localhost:3000/users/3a7d11ad-3e13-4025-b4ac-166d4d12b6e0 にアクセスしてください。何か困ったら http://localhost:3000/users/activation_help にアクセスしてください。"}%
```
http://localhost:3000/users/activation_helpにアクセスして以下メッセージが表示されればOK
```
{"message":"Basic認証の情報を伝え忘れてました。ユーザー名はRailsを作ったデンマーク人の名前です。3文字です。パスワードは彼の創設した会社の名前です。どちらも半角小文字で入力してください。"}
```
http://localhost:3000/users/ユーザのUUIDにアクセスして
[存在しないUUIDの場合]
ex) http://localhost:3000/users/3a7d11ad-3e13-4025-b4ac-166d4d12b6e0
```
User not found
```
[存在するUUIDの場合]
```

```