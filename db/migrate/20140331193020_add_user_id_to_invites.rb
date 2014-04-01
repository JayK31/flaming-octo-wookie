class AddUserIdToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :user_id, :integer
    add_index :invites, :user_id
  end
end
