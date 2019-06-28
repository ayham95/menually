ActiveAdmin.register Offer do

  permit_params :titleEn, :titleAr, :business_id, :descriptionAr, :descriptionEn, :image

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Business Details' do
      f.input :business_id, as: :select, collection: Business.all.map {|x| [x.nameEn, x.id]}
      f.input :titleEn
      f.input :titleAr
      f.input :descriptionAr
      f.input :descriptionEn
      f.input :image
    end
    f.actions
  end

end
