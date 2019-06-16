class HomeCategorySerializer < ActiveModel::Serializer
  attributes :id, :nameEn, :nameAr, :position, :items


  def items
    object.items.limit(10)
  end
end
