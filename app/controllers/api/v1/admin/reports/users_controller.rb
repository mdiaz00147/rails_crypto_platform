class Api::V1::Admin::Reports::UsersController < Api::V1::Admin::AdminsController

  def index
    total_results = Invoice.where(invoice_status:'paid').where(created_at:(params[:from_date])..(params[:to_date])).count
    offset = params[:per_page].to_i * (params[:page].to_i - 1)
    result = Invoice.where(invoice_status:'paid',created_at:(params[:from_date])..(params[:to_date]))
                    .order(created_at: :desc)
                    .offset(offset)
                    .limit(params[:per_page].to_i)
                    .joins(:plan)
                    .joins(:user)

    response.set_header('Per-Page', params[:per_page])
    response.set_header('Per-Page-Total', total_results)
    render json: result, status: 200
  end

  private
    def filter(object)
      object_tmp = object
      object     = object.attributes
      object['total_purchased'] = object_tmp.invoices.where(invoice_status:'paid').select(:id,:plan_id).map{|x|x.plan.price}.sum
      object['invoices']        = object_tmp.invoices.where(invoice_status:'paid').map{|x| invoice_filter(x) }
      return object
    end

    def invoice_filter(object)
      object_tmp = object
      object     = object.attributes
      object['total_price']   = object_tmp.plan.price
      object['currency']      = object_tmp.currency
      object['created_at'] = object_tmp.created_at.strftime("%d/%m/%Y %I:%M%p")
      object['updated_at'] = object_tmp.updated_at.strftime("%d/%m/%Y %I:%M%p")
      return object
    end

end
