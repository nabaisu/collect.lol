class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :condition_type
      t.string :condition
      t.references :zone, foreign_key: true
      t.integer :stickerbook_id
      t.references :collectible, foreign_key: true

      t.timestamps
    end
  end
end
