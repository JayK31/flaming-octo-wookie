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
    it { should belong_to(:user) }
  end
end

