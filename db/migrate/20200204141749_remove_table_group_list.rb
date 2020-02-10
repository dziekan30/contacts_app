class RemoveTableGroupList < ActiveRecord::Migration[6.0]
  def change
    remove_column :group_lists, :name, :string

  end
end
