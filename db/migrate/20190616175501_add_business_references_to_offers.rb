class AddBusinessReferencesToOffers < ActiveRecord::Migration[6.0]
  def change
    add_reference :offers, :business, null: false, foreign_key: true
  end
end
