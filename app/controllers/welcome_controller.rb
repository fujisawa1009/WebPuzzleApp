class WelcomeController < ApplicationController
  def start
    render json: { message: 'WebPuzzleへようこそ。ユーザー登録をお願いします。エンドポイントはこちら。/users' }
  end
end
