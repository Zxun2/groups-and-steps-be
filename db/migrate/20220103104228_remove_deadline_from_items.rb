class RemoveDeadlineFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :deadline, :date
  end
end
