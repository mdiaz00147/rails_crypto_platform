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

class User < ApplicationRecord
  attr_accessor :enable_tree
  attr_accessor :left
  #associations
  has_secure_password
  has_one_time_password

  has_ancestry :cache_depth => true
  has_many :invoices, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :invoices
  has_many :rewards, dependent: :destroy
  has_many :withdrawals, dependent: :destroy
  has_one :point, dependent: :destroy
  has_one :vault, dependent: :destroy
  belongs_to :sponsor, required: false, class_name: 'User', primary_key: 'uuid', foreign_key: 'parent_uuid'
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/img/anon_user.png'
  do_not_validate_attachment_file_type :avatar

  #validations
  VALID_EMAIL_REGEX    = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]*\z/

  validates :email, presence: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 15 }, format: { with: VALID_USERNAME_REGEX }, :on => :create
  validates :email, format: { with: VALID_EMAIL_REGEX  }
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates_confirmation_of :password
  validate :sponsor_exists?, :on => :create, if: -> { self.class.count > 0 }

  #calllbacks
  # after_create :define_roots, if: :roots_are_not_defined?
  before_create :generate_uuid
  before_create :parent_user_asign
  before_create :set_node_side, if: -> { self.left }
  before_save :assign_parent, if: -> { self.class.count > 0 && !self.ancestry && enable_tree }, :on => :update
  before_save  :downcase_username
  after_create :rebuild_depth_cache!
  after_create :create_vault
  after_create :create_point

  scope :only_deleted, -> { unscope(where: :deleted_at).where.not(deleted_at: nil) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }
  default_scope -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.zone.now)
  end

  def last_subs
    subscriptions.where(subscription_status:'active').last
  end

  def left_total_points
    point.left_total_points
  end

  def right_total_points
    point.right_total_points
  end

  def reward_depth_name
    reward_depth.name
  end

  def otp_authentic?(code)
    authenticate_otp(code) if code.present?
  end

  def rewards_all
    rewards.all
  end

  def total_rewards
    rewards_all.pluck(:value).sum.to_f.round(2)
  end

  def total_incentive_rewards
    rewards_all.where(reward_type:'incentive').pluck(:value).sum.to_f.round(2)
  end

  def total_direct_rewards
    rewards_all.where(reward_type:'direct').pluck(:value).sum.to_f.round(2)
  end

  def total_residual_rewards
    rewards_all.where(reward_type:'residual').pluck(:value).sum.to_f.round(2)
  end

  def total_binary_rewards
    rewards_all.where(reward_type:'binary').pluck(:value).sum.to_f.round(2)
  end

  def total_3x_rewards
    rewards_all.where(reward_type:['direct','residual','binary']).pluck(:value).sum.to_f.round(2)
  end


  private

    def generate_uuid
      self.uuid   = SecureRandom.uuid
    end

    def assign_parent
      self.parent_uuid = self.class.first.uuid if self.parent_uuid.nil?
      parent           = self.sponsor
      parent.right     = !self.left_parent_bak if !self.left_parent_bak.nil?

      if parent.right
        self.left_son = false
        if parent.children.pluck(:id).count == 2 || parent.children.where(left_son: false).pluck(:id).count == 1
          result = find_last_user(parent.children.where(left_son: false).first, false)
          self.ancestry = result
        else
          self.ancestry = parent.ancestry + '/' + parent.id.to_s
        end
      else
        self.left_son = true
        if parent.children.pluck(:id).count == 2 || parent.children.where(left_son: true).pluck(:id).count == 1
          result = find_last_user(parent.children.where(left_son: true).first, true)
          self.ancestry = result
        else
          self.ancestry = parent.ancestry + '/' + parent.id.to_s
        end
      end
    end

    def find_last_user(user, left)
      result = user.children.where(left_son: left) if user
      return user.ancestry + '/' + user.id.to_s if result.count == 0
      find_last_user(result.first, left)
    end

    def rebuild_depth_cache!
      self.class.rebuild_depth_cache!
    end

    def create_vault
      Vault.create(user_id:self.id)
    end

    def create_point
      Point.create(user_id: self.id)
    end

    def downcase_username
      self.email = self.email.delete(' ').downcase
      self.username = self.username.downcase.strip
    end

    def set_node_side
      self.left_son = self.left
    end

    def sponsor_exists?
      parent = self.class.find_by(username: self.parent_uuid)
      if !parent
        return errors.add(:sponsor, " not valid")
      end
    end

    def parent_user_asign
      parent = self.class.find_by(username: self.parent_uuid)
      if parent
        self.parent_uuid = parent.uuid
      end
    end
end
