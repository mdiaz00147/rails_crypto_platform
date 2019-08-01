class Api::V1::Admin::SessionsController < Api::V1::Admin::AdminsController
  skip_before_action :admin_user, only: [:create]
  skip_before_action :authenticate_request!, only: [:create]

  # open session for new user admin
  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.admin
      if user.enabled_google_authenticator?
        if user.otp_authentic?(params[:google_code]) && user.authenticate(params[:password])
          auth_token(user)
        else
          render json: ['Username/Password/google code invalid'], status: :unauthorized
        end
      elsif user.authenticate(params[:password])
        auth_token(user)
      else
        render json: ['Username/Password invalid'], status: :unauthorized
      end
    else
      render json: ['Username/Password invalid'], status: :unauthorized
    end
  end

  # return if session is still active
  def show
    if @current_user
      render json: { m: 'Session still active' }, status: :ok
    else
      render json: { m: 'Token expired' }, status: 401
    end
  end

  private

  def auth_token(user)
    auth_token = JsonWebToken.encode({ uuid: user.uuid })
    user.update(last_login: Time.now.utc)
    render json: { user: filter(user), auth_token: auth_token }, status: :ok
  end

  def filter(user)
    user_tmp = user
    user = user.attributes.except('id', 'created_at', 'updated_at', 'confirmed_at', 'password_digest')
    user
  end
end
