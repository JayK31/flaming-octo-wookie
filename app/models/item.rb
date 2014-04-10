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
  has_many :users, :through => :trips

  #method on item that searches for tweets using the item name (self.name)
  def search
    result = HTTParty.get("https://api.twitter.com/1.1/search/tweets.json",
      :query => { 'q' => self.name },
      :headers => {
         'Authorization' => "Bearer #{ENV['TWIT']}"
        })
    result_body = result.body
    json_result_body = JSON.parse(result_body)
    statuses = json_result_body["statuses"]
    texts = statuses.map { |status| status["text"]}
  end

  # create method to check if item is claimed
  def claim
    if self.is_claimed == true
      "Yes, someone is bringing this item."
    else
      "Nope, click on the item name to bring the item!"
    end
  end
end

