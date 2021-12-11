class CreateGathers < ActiveRecord::Migration[6.1]
  def change
    create_table :gathers do |t|
      t.string :when
      t.string :how
      t.string :link
      t.string :extra_information
      t.string :description
      t.string :condition
      t.references :user, foreign_key: true
      t.references :stickerbook, foreign_key: true
      t.references :zone, foreign_key: true
      t.references :collectible, foreign_key: true

      t.timestamps
    end
  end
end
