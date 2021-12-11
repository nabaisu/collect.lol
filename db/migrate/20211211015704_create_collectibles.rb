class CreateStartingEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :collectibles do |t|
      t.string :kind, null: false
      t.string :title, null: false
      t.string :description, null: true
      t.string :photo, null: true
      t.string :icon, null: true

      t.timestamps
    end

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

    create_table :zones do |t|
      t.string :kind, null: false
      t.string :name, null: false
      t.string :code
      t.string :capital
      t.string :subregion
      t.string :childs_type

      t.timestamps
    end

    create_table :stickerbooks do |t|
      t.string :title
      t.string :created_by

      t.timestamps
    end

    create_table :rules do |t|
      t.string :condition_type
      t.string :condition

      t.references :stickerbook, foreign_key: true, null: true
      t.references :zone, foreign_key: true, null: true
      t.references :collectible, foreign_key: true, null: true

      t.timestamps
    end

    create_table :gathers do |t|
      t.string :when
      t.string :how
      t.string :link
      t.string :extra_information
      t.string :description
      t.string :condition
      t.references :user, foreign_key: true, null: false
      t.references :stickerbook, foreign_key: true, null: false
      t.references :zone, foreign_key: true, null: false

      t.timestamps
    end
  end
end
