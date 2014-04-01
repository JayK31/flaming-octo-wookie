class CreateInvitesAgain < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user, index: true
      t.references :trip, index: true
      t.boolean :is_going, :default => true
      t.timestamps
    end
  end
end
