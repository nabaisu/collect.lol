class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :email
      t.string :gender
      t.string :login
      t.string :phone
      t.string :phone_country_code
      t.boolean :is_anon
      t.boolean :active
      t.string :deactivated_reason
      t.boolean :email_confirmed
      t.boolean :phone_confirmed
      t.boolean :account_verified
      t.datetime :account_verified_time
      t.string :jwt_token
      t.datetime :last_login_at

      t.timestamps
    end
  end
end
