class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email.downcase])
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to user
    else
      # エラーメッセージを表示する
      flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
end
