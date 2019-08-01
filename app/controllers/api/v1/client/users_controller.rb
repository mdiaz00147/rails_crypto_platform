class Api::V1::Client::UsersController < Api::V1::Client::ClientsController
  skip_before_action :authenticate_request!, except: [:show, :authenticator, :update_authenticator, :update, :biggest_plan, :index]

  def index
    result = User.where("id > ?", 3).limit(30).order(created_at: :desc)
    render json: result, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # EmailNotification.send_confirmation_email_temp(temp_email, username, params[:password])
      auth_token = JsonWebToken.encode({uuid: @user.uuid}) 
      render json: { user: SessionsHelper.filter(@user), auth_token: auth_token }, status: :ok
    else
      render json: @user.errors.map { |x, mess| "#{x} #{mess}".capitalize }, status: :unprocessable_entity
    end
  end

  # show user attributes
  def show
    result = @current_user
    render json: @current_user, status: :ok
  end

  # update user attributes
  def update
    if @current_user.update(user_params)
      render json: @current_user, status: :ok
    else
      render json:  @current_user.errors.map { |x, mess| "#{x} #{mess}".capitalize }, status: :unprocessable_entity
    end
  end

  def authenticator
    result = @current_user
    render json: UserHelper.filter(result, request), status: :ok
  end

  def update_authenticator
    if @current_user.otp_authentic?(params[:google_code]) && @current_user.authenticate(params[:password]).present?
      if @current_user.update(enabled_google_authenticator: params[:disabled])
        render json: UserHelper.filter(@current_user, request), status: :ok
      else
        render json: @current_user.errors.map { |x, mess| "#{x} #{mess}".capitalize }
      end

    else
      render json: { message: ['wrong code'] }, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.permit(
        :name,
        :last_name,
        :email,
        :username,
        :password,
        :password_confirmation,
        :phone,
        :document,
        :country,
        :city,
        :address,
        :about,
        :parent_uuid,
        :right,
        :left_parent_bak,
        :tos_sign,
        :btc_wallet,
        :ltc_wallet
      )
    end

end
