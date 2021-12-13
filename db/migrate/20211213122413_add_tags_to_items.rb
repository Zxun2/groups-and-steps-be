class AddTagsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :tags, :text, array: true, default: []
  end
end
