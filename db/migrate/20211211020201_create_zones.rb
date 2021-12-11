class CreateZones < ActiveRecord::Migration[6.1]
  def change
    create_table :zones do |t|
      t.string :type
      t.string :name
      t.string :code
      t.string :capital
      t.string :subregion
      t.string :childs_type

      t.timestamps
    end
  end
end
