class Trip < ActiveRecord::Base
  validates :start, presence: true
  validates :destination, presence: true
  has_many :items
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :invites
  has_many :users, :through => :invites
end
