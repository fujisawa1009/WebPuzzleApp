class UsersController < ApplicationController
  before_action :check_authentication, only: [:create]

  def index
    # curl http://localhost:3000/users
    render json: { message: 'HTTPメソッド、それであってる？。' }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # curl -X POST -H "Authorization: Bearer XXXX-XX-XX" -d "name=fujisawa" http://localhost:3000/users
      render json: { message: "ユーザーの仮登録が完了しました。本登録をするためにブラウザで http://localhost:3000/users/#{@user.uuid} にアクセスしてください。何か困ったら http://localhost:3000/users/activation_help にアクセスしてください。"
      }
    else
      # Nameが空の場合 {"message":"Name can't be blank"}
      render json: { message: @user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def activation_help # http://localhost:3000/users/activation_help
  end

  def show
    # 特定のユーザーを取得する処理
    @user = User.find_by(uuid: params[:id])

    if @user
      # UUIDのユーザーが存在する場合の処理
      render 'users/show' # app/views/users/show.html.erb を表示
    else
      # UUIDのユーザーが存在しない場合の処理
      render plain: 'User not found', status: :not_found
    end
  end

  def authenticate
    # 特定のユーザーを取得する処理
    @user = User.find_by(uuid: params[:id])
    user_uuid = @user.uuid
    secret_keyword = params[:secret_keyword]
    base64_secret_keyword = Base64.strict_encode64(@user.uuid)

    # 2423feae-66cb-4dde-a090-8e8062123e38 で送れば惜しい
    # MjQyM2ZlYWUtNjZjYi00ZGRlLWEwOTAtOGU4MDYyMTIzZTM4 で送付すれば成功
    if @user && secret_keyword == base64_secret_keyword
      puts "成功です"
    elsif @user && secret_keyword == user_uuid
      puts "パスワードをBase64エンコードしてください"
    else
      puts "失敗です"
    end
  end

  private

  def check_authentication
    token = request.headers['Authorization']
    expected_token = Time.now.strftime('%Y-%m-%d')

      if token.nil?
      # curl -X POST http://localhost:3000/users
      render json: { message: "伝え忘れてました。一応簡易的な認証機能をつけてます。AuthorizationヘッダーにBearerトークンを設定してください。トークンは本日の日付です。フォーマットはyyyy-mm-ddです。" }, status: :unauthorized
      return
    end

    unless token == "Bearer #{expected_token}"
      # curl -X POST -H "Authorization: Bearer XXXX-XX-XX" http://localhost:3000/users(本日日付でない場合)
      render json: { message: "トークン日付が違うよ" }, status: :unauthorized
      return
    end
  end

  def user_params
    params.permit(:name,:uuid)
  end
end
