class Business < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:managerPhone]

  has_many :categories
  before_validation {self[:uid] = self[:managerPhone]}
  before_save -> { skip_confirmation! }


  def email_required?
    false
  end

  def email_changed?
    false
  end

end
