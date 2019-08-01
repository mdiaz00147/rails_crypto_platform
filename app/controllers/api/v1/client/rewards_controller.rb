class Api::V1::Client::RewardsController < Api::V1::Client::ClientsController

  # list rewards depending on params
  def index
    reward_type = params[:type] && params[:type].split(',') || !params[:type] && 'incentive'
    if JSON.parse(params[:total])
      total = @current_user.rewards.where(reward_type: reward_type).pluck(:value).reduce(0, :+).round(2)
      render json: total
    else
      total_results = @current_user.rewards.where(reward_type: reward_type).count
      offset = params[:per_page].to_i * (params[:page].to_i - 1)
      result = @current_user.rewards.where(reward_type: reward_type).limit(params[:per_page].to_i)
                    .offset(offset)
                    .order(created_at: :desc)
      response.set_header('Per-Page', params[:per_page])
      response.set_header('Per-Page-Total', total_results)
      render json: result
    end
  end
end
