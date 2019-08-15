ActiveAdmin.register Business do

  permit_params :nameEn, :nameAr, :managerPhone, :theme, :logo, :wifiPassword, :password


  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Business Details' do
      f.input :nameAr
      f.input :nameEn
      f.input :managerPhone
      f.input :theme
      f.input :logo, :as => :file, :hint => image_tag(f.object.logo)
      f.input :wifiPassword
      f.input :password
    end


    f.actions

  end




  permit_params do
    permitted = [:nameAr, :nameEn, :logo, :theme, :managerPhone, :wifiPassword, :password]
    # permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

end
