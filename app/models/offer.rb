class Offer < ApplicationRecord
  belongs_to :business
  mount_uploader :image, OfferImageUploader
end
