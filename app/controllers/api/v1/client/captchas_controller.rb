class Api::V1::Client::CaptchasController < Api::V1::Client::ClientsController
  skip_before_action :authenticate_request!

  # create a new request to solve a captcha 
  def create
    api_call  = HTTParty.post('https://www.google.com/recaptcha/api/siteverify', 
      body: {
        secret: '6LelyowUAAAAAPdiLzf3NJxFYDtTyDwUv9VKUW_l', 
        response: params[:token]
      })
    json = JSON.parse(api_call.body)
    render json: json
  end

end
