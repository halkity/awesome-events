class SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  # 参照URL: https://github.com/omniauth/omniauth#integrating-omniauth-into-your-application
  def create
    user = User.find_or_create_from_auth_hash!(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
    # omniauth.authは認証ハッシュを提供してくれるメソッド。
    # 詳細はhttps://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema
  end

end
