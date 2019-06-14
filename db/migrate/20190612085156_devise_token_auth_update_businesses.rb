class DeviseTokenAuthUpdateBusinesses < ActiveRecord::Migration[6.0]
  def change

    change_table(:businesses) do |t|
      ## Required
      t.string :provider, :null => false, :default => "phone"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## User Info
      t.string :email

      ## Tokens
      t.json :tokens
    end

    add_index :businesses, :email,                unique: false
    add_index :businesses, [:uid, :provider],     unique: true
    add_index :businesses, :reset_password_token, unique: true
    # add_index :businesses, :confirmation_token,   unique: true
    add_index :businesses, :current_sign_in_at

    # add_index :businesses, :unlock_token,       unique: true
  end
end
