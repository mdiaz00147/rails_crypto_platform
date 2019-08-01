# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  uuid                         :string
#  parent_uuid                  :string
#  right                        :boolean          default(TRUE)
#  active                       :boolean          default(FALSE)
#  temp_user                    :boolean          default(TRUE)
#  active_binary                :boolean          default(FALSE)
#  withdrawals_enabled          :boolean          default(TRUE)
#  left_son                     :boolean          default(TRUE)
#  username                     :string
#  name                         :string
#  last_name                    :string
#  email                        :string
#  password_digest              :string
#  phone                        :string
#  document                     :string
#  country                      :string
#  city                         :string
#  address                      :string
#  country_iso                  :string
#  last_ip                      :string
#  btc_wallet                   :string
#  ltc_wallet                   :string
#  otp_secret_key               :string
#  ancestry                     :string(512)
#  ancestry_depth               :integer          default(0)
#  enabled_google_authenticator :boolean          default(FALSE)
#  deleted_at                   :datetime
#  last_login                   :datetime
#  admin                        :boolean          default(FALSE)
#  left_parent_bak              :boolean
#  avatar_file_name             :string
#  avatar_content_type          :string
#  avatar_file_size             :integer
#  avatar_updated_at            :datetime
#  lock_version                 :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_users_on_ancestry  (ancestry)
#  index_users_on_username  (username) UNIQUE
#  index_users_on_uuid      (uuid)
#

class UserSerializer < ActiveModel::Serializer
  attributes :uuid,
    :id,
    :name,
    :active,
    :parent_uuid,
    :last_name,
    :email,
    :username,
    :phone,
    :document,
    :country,
    :city,
    :address,
    :active_binary,
    :temp_user,
    :right,
    :avatar,
    :country_iso,
    :created_at,
    :updated_at,
    :provisioning_uri,
    :withdrawals_enabled,
    :btc_wallet,
    :ltc_wallet,
    :last_ip,
    :last_login,
    :last_subs,
    :direct_users,
    :binary_users

  has_one :sponsor
  has_one :vault
  has_one :point

  def binary_users
    return object.descendants.count
  end

  def direct_users
    return User.where(parent_uuid: object.uuid).count
  end

  def last_subs
    object.last_subs && SubscriptionSerializer.new(object.last_subs)
  end

  def created_at
    return object.created_at.strftime("%d/%m/%Y %I:%M%p")
  end

  def updated_at
    return object.created_at.strftime("%d/%m/%Y %I:%M%p")
  end

  def last_login
    return object.last_login && object.last_login.strftime("%d/%m/%Y %I:%M%p")
  end

  def provisioning_uri
    return object.provisioning_uri
  end
end
