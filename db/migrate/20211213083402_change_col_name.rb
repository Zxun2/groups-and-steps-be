class ChangeColName < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :name, :step
  end
end
