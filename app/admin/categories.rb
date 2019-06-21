ActiveAdmin.register Category do

  permit_params :nameEn, :nameAr, :business_id, :position

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Business Details' do
      f.input :nameEn
      f.input :nameAr
      f.input :business_id, as: :select, collection: Business.all.map{|x| [x.nameEn, x.id]}
      f.input :position, as: :select, collection: params[:id].present? ? ((1..32).to_a - (Category.all.pluck :position).to_a + [(Category.find(params[:id]).position)]).sort : 1..32
    end
    f.actions
  end

end