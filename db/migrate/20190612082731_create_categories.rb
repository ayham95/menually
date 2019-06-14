class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :business, null: false, foreign_key: true
      t.string :nameEn
      t.string :nameAr
      t.integer :position

      t.timestamps
    end
  end
end
