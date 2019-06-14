class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :nameAr
      t.string :nameEn
      t.string :logo
      t.string :theme
      t.string :managerPhone
      t.string :wifiPassword

      t.timestamps
    end
  end
end
