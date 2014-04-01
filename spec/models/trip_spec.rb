# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  start       :string(255)
#  destination :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Trip do
  let(:trip) {Trip.create(start: "China", destination: "London")}
  #test new trip instances
  context "::trip" do
    # let(:user) { User.new }
    it "should be a trip" do
      expect( trip.class ).to eq Trip
    end
    it "should be an instance of ActiveRecord" do
      expect( trip ).to be_a(ActiveRecord::Base)
    end
  end

#test validations first using shoulda matcher
#will handle relationships later
  context "validators" do
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:destination) }
    it { should have_many(:items) }
    it { should belong_to(:user).with_foreign_key('user_id') }
    it { should have_many(:invites) }
    it { should have_many(:users).through(:invites) }
  end
end

