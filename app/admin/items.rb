ActiveAdmin.register Item do

  permit_params :nameEn, :nameAr, :descriptionEn, :descriptionAr, :preparationTime, :position, :price, :image, :category_id

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Business Details' do
      f.input :category_id, as: :select, collection: Category.all.map{|x| [x.nameEn, x.id]}
      f.input :nameEn
      f.input :nameAr
      f.input :descriptionEn
      f.input :descriptionAr
      f.input :preparationTime
      f.input :position, as: :select, collection: 1..32
      f.input :price
      f.input :image
    end
    f.actions
  end

end
