class TweetController < ApplicationController
  include ApplicationHelper
    #include apphelper to access search method

  def index
    tweet_item = Item.find(params[:id])
    tweet_item_name = tweet_item.name
    @results = search(tweet_item_name)
  end
end
