class Api::V1::Admin::PointsController < Api::V1::Admin::AdminsController

  # List all platform points
  def index
    render json: Point.all.order(created_at: :desc).map { |x| filter(x) }
  end


  # show point details
  def show
    result = Point.find(params[:id])
    render json: filter(result), status:200
  end

  # update points data
  def update
    @point  =   Point.find(params[:id])
    if @point.update(point_params)
      render json: filter(@point), status: :ok
    else
      render json: { message: @point.errors.map { |x, mess| "#{x} #{mess}".capitalize } }, status: :unprocessable_entity
    end
  end

  private
    def point_params
      params.permit(
        :left_points,
        :right_points,
        :diff,
        :left_total_points,
        :right_total_points
      )
    end

    def filter(object)
      object_tmp = object
      object     = object.attributes.except('created_at', 'updated_at', 'password_digest', 'confirmation_token', 'active')
      object['user']        = object_tmp.user
      object['balanced_at'] = object_tmp.balanced_at.strftime("%d/%m/%Y %I:%M%p") if object_tmp.balanced_at
      object['created_at'] = object_tmp.created_at.strftime("%d/%m/%Y %I:%M%p")
      object['updated_at'] = object_tmp.updated_at.strftime("%d/%m/%Y %I:%M%p")
      object
    end

end
