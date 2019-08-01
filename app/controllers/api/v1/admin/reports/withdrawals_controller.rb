class Api::V1::Admin::Reports::WithdrawalsController < Api::V1::Admin::AdminsController

  def index
    all_times = Withdrawal.where(withdrawal_status:'paid').map{|x| x.value }.reduce(0,:+)
    # current_year = Withdrawal.where(created_at: (Time.now.beginning_of_year)..(Time.now)).map{|x| x.price }.reduce(0,:+)
    # all_times    = Withdrawal.where(created_at: (Time.now.beginning_of_year - 5.year)..(Time.now)).map{|x| x.price }.reduce(0,:+)
    render json: {
      # current_month: current_month,
      # current_year: current_year,
      all_times: number_to_currency(all_times.round(2))
    }, status: 200
  end

end
