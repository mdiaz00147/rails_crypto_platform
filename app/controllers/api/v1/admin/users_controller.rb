class Api::V1::Admin::UsersController < Api::V1::Admin::AdminsController

  # list all  users on the system
  def index
    model = params[:user_type] == '1' ? TempUser : User

    total_results = model.all.count
    offset = params[:per_page].to_i * (params[:page].to_i - 1)
    result = model.all.limit(params[:per_page].to_i)
                      .offset(offset)
                      .order(created_at: :desc)

    response.set_header('Per-Page', params[:per_page])
    response.set_header('Per-Page-Total', total_results)
    render json: result, status: :ok
  end

  # show user details
  def show
    model = params[:user_type] == '1' ? TempUser : User

    if params[:username]
      result = [model.find_by(username: params[:username])]
    else
      result = model.find_by(uuid: params[:id])
    end

    render json: result, status: :ok
  end

  def usernames
    if params[:user_type].present?
      model = params[:user_type] == '1' ? TempUser : User
      result = model.all.pluck(:username)
    else
      result = User.all.pluck(:username).concat(TempUser.all.pluck(:username)).uniq if !params[:extended].present?
      result = User.all.order(created_at: :desc).pluck(:id,:uuid,:username,:ancestry)if params[:extended].present?
    end

    render json: result, status: 200
  end

  # update user data
  def update
    model = params[:user_type] == '1' ? TempUser : User
    @user  =  model.find_by(uuid: params[:id])

    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { message: @user.errors.map { |x, mess| "#{x} #{mess}".capitalize } }, status: :unprocessable_entity
    end
  end

  # destroy users on the system
  def destroy
    user = User.find_by(uuid:params[:id])
    render json: { m: 'Destroyed' }, status: 200 if user.soft_delete
  end

  private
    def user_params
      params.permit(
        :right,
        :parent_uuid,
        :active,
        :left_son,
        :username,
        :name,
        :last_name,
        :email,
        :password,
        :phone,
        :document,
        :country,
        :city,
        :address,
        :ancestry,
        :enabled_google_authenticator,
        :withdrawals_enabled
      )
    end
end
