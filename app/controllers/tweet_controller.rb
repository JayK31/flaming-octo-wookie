class TweetController < ApplicationController
  include ApplicationHelper

  def index
    tweet_item = Item.find(params[:id])
    tweet_item_name = tweet_item.name
    @results = search(tweet_item_name)
    # find_body = results.body
    # json = JSON.parse(find_body)
    # statuses = json["statuses"]
    # @mother_fucker = statuses.map { |status| status["text"] }
  end


end
