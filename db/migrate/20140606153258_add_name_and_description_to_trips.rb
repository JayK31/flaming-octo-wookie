class AddNameAndDescriptionToTrips < ActiveRecord::Migration
  def self.up
    add_column :trips, :name, :string, limit: 20
    add_column :trips, :description, :text, limit: 255
  end
end

