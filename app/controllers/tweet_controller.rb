class TweetController < ApplicationController

  def index
    tweet_item = Item.find(params[:id])
    tweet_item_name = tweet_item.name
    @results = tweet_item.search
  end
end
