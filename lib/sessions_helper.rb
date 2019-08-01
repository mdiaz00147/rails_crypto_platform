include ActionView::Helpers::NumberHelper

module SessionsHelper

  def self.filter(object)
    object_tmp = object
    object     = object.attributes.except('id', 'created_at', 'updated_at', 'confirmed_at', 'password_digest')
    if object_tmp.respond_to? (:vault)
      object['active_binary']      = UserCheck.user_has_two_directs_each_side?(object_tmp) if !object_tmp.active_binary
      object['total_vault']        = number_to_currency(object_tmp.vault.amount)
      object['direct_comissions']  = number_to_currency(object_tmp.vault.direct_comissions)
      object['binary_comissions']  = number_to_currency(object_tmp.vault.binary_comissions)
      object['residual_comissions'] = number_to_currency(object_tmp.vault.residual_comissions)
      object['total_comissions']    = number_to_currency(object_tmp.vault.total_rewards)
      object['point']              = object_tmp.point
    end
    return object
  end

end
