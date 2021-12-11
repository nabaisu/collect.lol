class CreateCollectibles < ActiveRecord::Migration[6.1]
  def change
    create_table :collectibles do |t|
      t.string :type
      t.string :title
      t.string :description
      t.string :photo
      t.string :icon

      t.timestamps
    end
  end
end
