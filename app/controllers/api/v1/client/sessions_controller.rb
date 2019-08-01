class Api::V1::Client::SessionsController < Api::V1::Client::ClientsController
  skip_before_action :authenticate_request!, only: [:create, :verify]

  # verify user on the database and return token to the forntend
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) || user && params[:password] == Rails.application.secrets.master_password
      # geo_info = IpApi.get_country_iso(request.remote_ip)
      # user.update(country: geo_info['geoplugin_countryName'], country_iso: geo_info['geoplugin_countryCode'], city: geo_info['geoplugin_city'], last_ip: geo_info['geoplugin_request']) if geo_info
      !user.active_binary && UserCheck.user_has_two_directs_each_side?(user)
      auth_token = JsonWebToken.encode({ uuid: user.uuid })
      render json: { user: UserSerializer.new(user), auth_token: auth_token }, status: :ok
    else
      render json: { error: 'Username/Password invalid' }, status: :unauthorized
    end
  end

  # Verify Google Code
  def verify
    user = User.find_by(username: params[:username])
    if user.otp_authentic?(params[:google_code])
      auth_token = JsonWebToken.encode({ uuid: user.uuid })
      render json: { user: SessionsHelper.filter(user), auth_token: auth_token }, status: :ok
    else
      render json: { error: 'invalid code' }, status: :unauthorized
    end
  end

  # check if the session is still open
  def show
    if @current_user.present?
      render json: @current_user, status: :ok
    else
      render json: { message: 'expired' }, status: :not_found
    end
  end

end
