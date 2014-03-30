class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :quantity, presence: true
  belongs_to :user
  belongs_to :trip
end
