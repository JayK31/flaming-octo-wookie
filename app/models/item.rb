# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  quantity   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  trip_id    :integer
#

class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :quantity, presence: true
  has_many_and_belongs_to :users
  belongs_to :trip
end
