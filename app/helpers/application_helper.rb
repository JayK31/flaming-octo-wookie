module ApplicationHelper
  #methods here can be accessed anywhere in app, just include AppHelper

  #setting up session controller
  #assign current_user conditionally to current user using used_id
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #create predicate method logged_in to define if current user is logged in
  def logged_in?
    current_user.present?
  end

  # def current_trip
  #   @current_trip ||= Trip.find(params[:id])
  # end

  # #define whether or not someone is the trip_leader
  # def trip_leader?
  #   return true if @current_user.id == @current_trip.id
  # end

  def search(item)
  #TODO: tried to use ENV variable below, receiving bad authentication error
  # Bearer #{ENV['TWIT']}

    result = HTTParty.get("https://api.twitter.com/1.1/search/tweets.json",
      :query => { 'q' => item },
      :headers => {
         'Authorization' => "Bearer AAAAAAAAAAAAAAAAAAAAAMJSWwAAAAAA301b%2BYvUOrtsth7lebCike%2B7X6o%3DaC3pu8zvuFK8YVn71BVpg2mcGg9msg82vTuC54dgT68L5BZKSP"
        })
    result_body = result.body
    json_result_body = JSON.parse(result_body)
    statuses = json_result_body["statuses"]
    texts = statuses.map { |status| status["text"]}
  end

end
