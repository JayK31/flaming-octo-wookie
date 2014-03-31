class ChangeColumnInItemsFromIsClaimedToIsClaimed < ActiveRecord::Migration
  def change
    rename_column :items, :is_claimed?, :is_claimed
  end
end


