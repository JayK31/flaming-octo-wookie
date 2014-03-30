class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates_length_of :password, in: 8..16
  has_secure_password
  has_many :trips
  has_many :items


end