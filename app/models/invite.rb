# == Schema Information
#
# Table name: invites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trip_id    :integer
#  is_going   :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)
#

class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  def existing_user    
    return true if @invites.include? @user
  end
end


