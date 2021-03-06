# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates_length_of :password, in: 8..16, allow_nil: true
  validates_format_of :email, :with => /@/
  has_secure_password
  has_many :trips
  has_many :items, :through => :trips
  has_many :invites
  has_many :trips, :through => :invites
  has_attached_file :avatar, :styles => { :medium => "150x150>", :thumb => "100x100>" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

