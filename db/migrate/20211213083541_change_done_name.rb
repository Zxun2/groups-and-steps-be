class ChangeDoneName < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :done, :completed
  end
end
