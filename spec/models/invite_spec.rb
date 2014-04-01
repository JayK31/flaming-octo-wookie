require 'spec_helper'

describe Invite do
  let(:invite) { Invite.create(user_id: 1, trip_id: 1, is_going: true, email: 'jay@jay.com') }

  context "::invite" do
    it "should be an invite" do
      expect( invite.class ).to eq Invite
    end
    it "should be an instance of ActiveRecord" do
      expect( invite ).to be_a(ActiveRecord::Base)
    end
  end

  context "validators" do
    it { should belong_to(:user) }
    it { should belong_to(:trip) }
  end
end
