class CreateStickerbooks < ActiveRecord::Migration[6.1]
  def change
    create_table :stickerbooks do |t|
      t.string :title
      t.string :created_by
      t.references :rules, foreign_key: true

      t.timestamps
    end
  end
end
