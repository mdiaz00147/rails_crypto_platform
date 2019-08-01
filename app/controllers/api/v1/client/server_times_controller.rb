class Api::V1::Client::ServerTimesController < Api::V1::Client::ClientsController

  # list current server time for further validations on the frontend
  def index
    base_time = Time.zone.now
    date = base_time.strftime("%A")
    user_withdrawals = @current_user.withdrawals.where(withdrawal_status: 'pending')
    render json: {
      time: base_time,
      date: date,
    }, status: 200
  end

end
