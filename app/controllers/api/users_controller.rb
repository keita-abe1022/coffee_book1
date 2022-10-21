class Api::UsersController < ApplicationController
  protect_from_forgery except: [:create]

  def index
    @users = User.all
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
    @user = User.find(params[:id])
    render 'show', formats: :json, handlers: 'jbuilder'
  end

  def create
    user = User.new(user_params)
    if user.save
      # payloadはトークン自体に内包させれれるユーザー情報。ここではuser_idを内包させている。
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login
      # Set-cookieヘッダーに{jwt_access=アクセストークン; Secure; HttpOnly}をセットして送信
      response.set_cookie(JWTSessions.access_cookie,
                                      value: tokens[:access],
                                      httponly: true,
                                      secure: Rails.env.production?)
      # LocalStorageに保存するためのCSRFトークンを返す。
      render json: { csrf: tokens[:csrf] }
    else
      render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
