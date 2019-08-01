class Api::V1::Client::InvoicesController < Api::V1::Client::ClientsController
  skip_before_action :authenticate_request!, only: [:update]

  # list current user invoices and statuses
  def index
    result = @current_user.invoices.order(created_at: :desc)
    render json: result, status: :ok
  end

  # list specific invoices information
  def show
    result = @current_user.invoices.find(params[:id])
    render json: result, status: 200
  end

  # create new invoices based on the plan selection
  def create
    ActiveRecord::Base.transaction do
      @invoice = @current_user.invoices.new(invoice_params)
      if @invoice.save
        EmailNotification.send_invoice(@current_user, @invoice)
        render json: @invoice, status: 200
      else
        render json: @invoice.errors.map { |x, mess| "#{x} #{mess}".capitalize }, status: :unprocessable_entity
      end
    end
  end

  # update invoice as paid and then create a subscription based on the invoice paid
  def update
    return render json: { message: ['Nothing to do'] }, status: :ok if !params[:data]
    ActiveRecord::Base.transaction do
      @invoice  = Invoice.find_by(wallet: params[:data][:address], invoice_status: 'pending')
      @invoice && @invoice.with_lock do
        if @invoice && params[:data] && params[:data][:confirmations] && params[:data][:amount_received] && params[:data][:confirmations].to_i >= 0
          if (params[:data][:amount_received].to_f >= ((@invoice.fees + @invoice.price) * 0.95).round(6) && @invoice.invoice_status == 'pending')
            @invoice.user.update(active:true, temp_user:false, enable_tree:true) if @invoice.user.temp_user
            @subscription = Compensation.create_subscription(@invoice)
            if @subscription.present?
              InvoiceHelper.update_invoice(@invoice,params[:data][:txid],params[:notification_id])
              Compensation.update_binary_points(@subscription, @invoice) if !params[:data][:asign_comissions]
              Compensation.create_direct_reward(@invoice, @subscription) if !params[:data][:asign_comissions]
            end
            render json:  { message: ['Invoice updated'], success: true }, status: :ok
          else
            render json:  { message: ['Insufficient amount received'], success: false}, status: :ok
          end
        else
          render json:  { message: ['Not enough confirmations or amount received'], success: false}, status: :ok
        end
      end
    end
  end
  
  def update2
    render json: { message: ['Nothing to do'] }, status: :ok
  end

  private
    def invoice_params
      params.permit(
        :plan_id,
        :price,
        :fees,
        :description,
        :plan_name,
        :wallet,
        :currency_id
      )
    end
end
