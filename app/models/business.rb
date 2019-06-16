class Business < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:managerPhone]

  has_many :categories
  has_many :offers
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

end
