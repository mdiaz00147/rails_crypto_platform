class Api::V1::Admin::Reports::SubscriptionsController < Api::V1::Admin::AdminsController

  # bring all curret subscriptions
  def index

    current_month = Invoice.where(invoice_status:'paid',created_at:(Time.now.beginning_of_month.beginning_of_day)..Time.now).joins(:plan).select(:id,:plan_id,'plans.price as plan_price').map{|x|x.plan_price}.sum
    current_year = Invoice.where(invoice_status:'paid',created_at:(Time.now.beginning_of_year.beginning_of_day)..Time.now).joins(:plan).select(:id,:plan_id,'plans.price as plan_price').map{|x|x.plan_price}.sum
    all_times = Invoice.where(invoice_status:'paid',created_at:(Time.now.beginning_of_year - 5.year)..Time.now).joins(:plan).select(:id,:plan_id,'plans.price as plan_price').map{|x|x.plan_price}.sum

    render json: {
      current_month: number_to_currency(current_month.round(2)),
      current_year: number_to_currency(current_year.round(2)),
      all_times: number_to_currency(all_times.round(2))
    }, status: 200
  end

  # show subs for current chart
  def show
    current_month = Subscription.where(created_at: (Time.now.beginning_of_month)..(Time.now)) .select(:created_at,:price) .order(created_at: :asc) .group_by { |x|   x.created_at.strftime("%b %d") } 
    current_year  = Subscription.where(created_at: (Time.now.beginning_of_year)..(Time.now)) .select(:created_at,:price) .order(created_at: :asc) .group_by { |x|   x.created_at.strftime("%b %d") } 
    all_times     = Subscription.where(created_at: (Time.now.beginning_of_month - 4.year)..(Time.now)) .select(:created_at,:price) .order(created_at: :asc) .group_by { |x|   x.created_at.strftime("%b %d") } 
    result = {
      all_times: all_times,
      current_year: current_year,
      current_month: current_month
    }
    render json: result, status: 200
  end

end
