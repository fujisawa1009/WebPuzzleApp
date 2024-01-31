class PostsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(uuid: params[:id])
    @post = Post.new(content: params[:content])
    @post.onetime_password = params[:post][:onetime_password]
    if @post.onetime_password
      @post.save!
      redirect_to posts_path
    else
      @post.onetime_password.nil?
      flash[:alert] = t('ワンタイムパスワードが必要です。ワンタイムパスワードはcookieに保存しておきました。nameはpost[onetime_password]としてこのフォームに埋め込んで送信してください。あえて入力フォームは用意していませんので開発者ツールで無理やり作ってください。')
      redirect_to new_post_path(user_uuid: @user.uuid)
    end
  end
end

private

def post_params
  params.require(:post).permit(:content, :onetime_password)
end