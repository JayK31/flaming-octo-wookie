class RemoveUserIdFromInvitesAndAddColumnEmailToInvites < ActiveRecord::Migration
  def change
    remove_column :invites, :user_id
    add_column :invites, :email, :string
  end
end
