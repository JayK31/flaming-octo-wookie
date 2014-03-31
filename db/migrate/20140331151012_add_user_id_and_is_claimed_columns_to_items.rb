class AddUserIdAndIsClaimedColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :is_claimed?, :boolean, :default => false
    add_column :items, :description, :string
    remove_column :items, :user_id
    add_column :items, :user_id, :integer
  end
end

