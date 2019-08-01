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

# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'John', email: 'john@example.com', username:'adminuser')
  end

  test "username should be unique" do
    duplicate_item = @user.dup
    assert_not duplicate_item.valid?
  end
end
