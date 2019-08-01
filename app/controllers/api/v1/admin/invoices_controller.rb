class Api::V1::Admin::InvoicesController < Api::V1::Admin::AdminsController

  # List all invoices on the system
  def index
    if params[:filtered]
      if params[:user_type].present?
        result = User.all.pluck(:username)
      else
        result = User.all.pluck(:username) if !params[:extended].present?
        result = User.all.order(created_at: :desc).pluck(:id,:uuid,:username,:ancestry)if params[:extended].present?
      end
      render json: result, status: 200
    else
      total_results = Invoice.where(invoice_status: params[:status]).count
      offset = params[:per_page].to_i * (params[:page].to_i - 1)
      result = Invoice.where(invoice_status: params[:status])
                        .limit(params[:per_page].to_i)
                        .offset(offset)
                        .order(created_at: :desc)

      response.set_header('Per-Page', params[:per_page])
      response.set_header('Per-Page-Total', total_results)
      render json: result, status: :ok
    end
  end

  # show specific invoice data
  def show
    if params[:username]
      user = User.find_by(username:params[:username]) ? (User.find_by(username:params[:username])) : (TempUser.find_by(username:params[:username]))
      result = user.invoices.order(created_at: :desc)
    else
      result = Invoice.find(params[:id])
    end
    render json: result, status: 200
  end

  # destroy invoice in the system
  def destroy
    invoice = Invoice.find_by(uuid:params[:id])
    render json: { m: 'Destroyed' }, status: 200 if invoice.soft_delete
  end

end
