class Category < ApplicationRecord
  belongs_to :business
  has_many :items
end
