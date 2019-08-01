class Api::V1::Client::PlansController < Api::V1::Client::ClientsController

  # list all available plans
  def index
    result = Plan.where(active: true).order(price: :asc)
    render json: result, status: 200
  end

  def show
    result = Plan.find_by(code: params[:id])
    render json: result, status: 200
  end
end
