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

```

