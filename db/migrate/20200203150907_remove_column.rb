class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :contact_id, :integer
  end
end
