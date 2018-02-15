class User < ActiveRecord::Base

  # == Modules == #
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable #, :omniauthable
  include DeviseTokenAuth::Concerns::User

  # == Constants == #

  # == Attributes == #

  # == File Uploader == #

  # == Associations and Nested Attributes == #
  has_one :profile, dependent: :destroy

  # == Validations == #

  # == Callbacks == #
  after_create :create_profile
  after_create :add_default_user_role

  # == Scopes and Other macros == #

  # == Instance methods == #

  # == Private == #
  private

  def add_default_user_role
    self.add_role(:member) if self.roles.blank?
  end

end
