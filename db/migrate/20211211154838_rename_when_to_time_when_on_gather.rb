class RenameWhenToTimeWhenOnGather < ActiveRecord::Migration[6.1]
  def change
    rename_column :gathers, :when, :time_when
  end
end
