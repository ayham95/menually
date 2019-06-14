class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :nameEn
      t.string :nameAr
      t.string :image
      t.string :descriptionEn
      t.string :descriptionAr
      t.string :preparationTime
      t.float :price
      t.integer :position
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
