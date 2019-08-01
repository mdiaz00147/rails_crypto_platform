module UserHelper
  # translate tremporal user to user if the invoice has been activated
  def self.create_user(temp_user, invoice)
    enable_tree = invoice.plan_id == 19 ? (false) : (true)
    user = User.create(
      name: temp_user.name,
      last_name: temp_user.last_name,
      username: temp_user.username,
      email: temp_user.email,
      password_digest: temp_user.password_digest,
      phone: temp_user.phone,
      document: temp_user.document,
      uuid: temp_user.uuid,
      address: temp_user.address,
      city: temp_user.city,
      country: temp_user.country,
      parent_uuid: temp_user.parent_uuid,
      parent_left_bak: temp_user.parent_left,
      enable_tree: enable_tree
    )
    return user
  end

  def self.filter(object, request)
    port        = request.port == 443 ? (80) : (request.port)
    base_url    = "http://#{request.host}:#{port}"
    object_tmp  = object
    object      = object.attributes.except('id','created_at', 'updated_at', 'password_digest', 'confirmation_token', 'active')
    object['avatar'] = {
      medium: base_url + object_tmp.avatar.url(:medium),
      thumb: base_url + object_tmp.avatar.url(:medium),
      original: base_url + object_tmp.avatar.url(:original)
    }
    object['sponsor']     = User.find_by(uuid: object_tmp.parent_uuid)
    object['created_at']  = object_tmp.created_at.strftime("%d/%m/%Y %I:%M%p")
    object['active']      = object_tmp.active ? 'Active' : 'Inactive'
    object['qr_code']     = object_tmp.provisioning_uri
    object
  end
end
