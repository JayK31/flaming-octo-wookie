# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  quantity    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  trip_id     :integer
#  is_claimed  :boolean          default(FALSE)
#  description :string(255)
#  user_id     :integer
#

class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :quantity, presence: true
  validates :description, presence: true
  belongs_to :trip
  has_many :users
  has_many :users, :through => :trips


  # def self.tweet(item)
  #     result = HTTParty.get("https://api.twitter.com/1.1/search/tweets.json",
  #     :query => { 'q' => item },
  #     :headers => {
  #       'Authorization' => 'Bearer AAAAAAAAAAAAAAAAAAAAAMJSWwAAAAAA301b%2BYvUOrtsth7lebCike%2B7X6o%3DaC3pu8zvuFK8YVn71BVpg2mcGg9msg82vTuC54dgT68L5BZKSP'
  #       })
    # end
end
