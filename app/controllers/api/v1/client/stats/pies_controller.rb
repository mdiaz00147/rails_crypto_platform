class Api::V1::Client::Stats::PiesController < Api::V1::Client::ClientsController

  # give correct data to the user
  def index
    total   = (@current_user.subscriptions.map{ |x| x.price }.reduce(0,:+) * 2)
    current = @current_user.rewards.map{ |x| x.value }.reduce(0,:+)
    current = total > 0 ?( ((current * 100) / total).round(2)) : (0)
    left    = (current.round(2) -100).round(2).abs
    render json: { 
      current: current, 
      left: left
    }, status: 200
  end

end
