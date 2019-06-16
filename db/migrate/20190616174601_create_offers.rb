class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :image
      t.string :titleEn
      t.string :titleAr
      t.string :descriptionEn
      t.string :descriptionAr
      t.boolean :active

      t.timestamps
    end
  end
end
