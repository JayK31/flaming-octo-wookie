class Trip < ActiveRecord::Base
  validates :start, presence: true
  validates :destination, presence: true
  belongs_to :user

end
