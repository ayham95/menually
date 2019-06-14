class Business < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:managerPhone]

  has_many :categories
  before_validation {self[:uid] = self[:managerPhone]}
  before_save -> { skip_confirmation! }
  validates_presence_of :nameAr, :nameEn, :managerPhone
  validates :password, presence: true, on: :create



  def email_required?
    false
  end

  def email_changed?
    false
  end

  # def password_required?
  #   true
  # end

end
