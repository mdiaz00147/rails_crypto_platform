module Authenticable
  class JsonWebToken
    # Encodes and signs JWT Payload with expiration
    def self.encode(payload)
      payload.reverse_merge!(meta)
      JWT.encode(payload, Rails.application.secrets.secret_key_base, algorithm = 'HS256')
    end

    # Decodes the JWT with the signed secret
    def self.decode(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base, true, options={algorithm: "HS256"})
    end

    # Validates the payload hash for expiration and meta claims
    def self.valid_payload(payload)
      if expired(payload)
        return false
      else
        return true
      end
    end

    # Default options to be encoded in the token
    def self.meta
      {
        exp: Rails.application.secrets.expiration_session.minutes.from_now.to_i
      }
    end

    # Validates if the token is expired by exp parameter
    def self.expired(payload)
      payload['exp'] < Time.now.to_i
    end
  end

  def set_user
    @user = TempUser.find_by(uuid: params[:uuid])
    @user = User.find_by(uuid: params[:uuid]) if !@user
    render json: { error: "Invalid user" }, status: :bad_request if !@user
  end

  def correct_user
    render json: { error: "Incorrect user" }, status: :unauthorized if @current_user != @user
  end

  def admin_user
    render json: { error: "No admin user" }, status: :unauthorized if !@current_user.has_attribute?(:admin) || !@current_user.admin
  end
end