class CategorySerializer < ActiveModel::Serializer
  attributes :id, :nameEn, :nameAr, :position
  has_many :items
end
