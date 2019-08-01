class Api::V1::Client::PassRecoveriesController < Api::V1::Client::ClientsController
  skip_before_action :authenticate_request!
  
  # send a new password to user email
  def create
    user = User.find_by(username: params[:username]) 
    if user
      new_password = SecureRandom.hex(5)
      user.update(username: params[:username], password: new_password, password_confirmation: new_password)
      EmailNotification.send_recovery_email(user,new_password)
      render json: { status: 'New password has been sent to your email' }, status: 200
    else
      render json: { status: 'User not found' }, status: 400
    end
  end

end
