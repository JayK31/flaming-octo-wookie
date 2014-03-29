class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :start
      t.string :destination
      t.references :user, index: true
      t.timestamps
    end
  end
end
