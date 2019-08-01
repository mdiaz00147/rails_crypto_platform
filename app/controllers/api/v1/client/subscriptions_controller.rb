class Api::V1::Client::SubscriptionsController < Api::V1::Client::ClientsController

  # list all the subscriptions for the user
  def index
    @subscriptions = @current_user.subscriptions.order(id: :desc)
    render json: @subscriptions, status: 200
  end

  # show current subscription status
  def show
    result = @current_user.subscriptions.find(params[:id])
    render json: result, status: 200
  end

end