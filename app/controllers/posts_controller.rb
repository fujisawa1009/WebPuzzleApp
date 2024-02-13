class PostsController < ApplicationController

  def index
    @users = User.includes(:posts).all
  end

  def new
    @post = Post.new
    onetime_password = generate_onetime_password # このメソッドは適切に実装する必要があります
    cookies[:onetime_password] = {
      value: onetime_password,
      expires: 1.hour.from_now, # 適切な有効期限を設定
    }
  end

  def create
    @user = User.find_or_create_by(uuid: params[:id])
    @post = @user.posts.build(content: params[:content])
    @post.onetime_password = params[:post][:onetime_password]
    if @post.onetime_password == cookies[:onetime_password]
      @post.save!
      redirect_to posts_path
    else
      @post.onetime_password.nil? || @post.onetime_password != cookies[:onetime_password]
      flash[:alert] = t('ワンタイムパスワードが必要です。ワンタイムパスワードはcookieに保存しておきました。nameはpost[onetime_password]としてこのフォームに埋め込んで送信してください。あえて入力フォームは用意していませんので開発者ツールで無理やり作ってください。')
      redirect_to new_post_path(user_uuid: @user.uuid)
    end
  end
end

private

def post_params
  params.require(:post).permit(:content, :onetime_password)
end

def generate_onetime_password
  SecureRandom.hex(16) # 16バイトのランダムな16進数文字列を生成する例
end