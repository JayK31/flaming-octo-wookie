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

require 'spec_helper'

describe Item do
  let(:item) {Item.create(name: "toothpaste", quantity: 1)}
  #test new trip instances
  context "::item" do
    it "should be an item" do
      expect( item.class ).to eq Item
    end
    it "should be an instance of ActiveRecord" do
      expect( item ).to be_a(ActiveRecord::Base)
    end
  end
 #test validations first using shoulda matcher
#will handle relationships later
  context "validators" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:description) }
    it { should belong_to(:trip) }
    # it { should have_many(:users) }
  end
  # it "Item#search" do
  #   expect( item.search ).to be_a(Array)
  # end
  it "Item#claim" do
    expect( item.claim ).to be_a(String)
  end
end

