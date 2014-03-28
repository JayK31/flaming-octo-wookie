require 'spec_helper'

describe User do

  #test new user instances
  context "::new" do
    let(:user) { User.new }
    it "should be a user" do
      expect( user.class ).to eq User
    end
    it "should be an instance of ActiveRecord" do
      expect( user ).to be_a(ActiveRecord::Base)
    end
  end

#test validations first using shoulda matcher
#will handle relationships later
  context "validators" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should have_secure_password }
  end
  #bug in shoulda matcher email validator
  it "must have unique email" do
    user = User.create(name: "Alec", email: "alec@alec.com", password: "password", password_confirmation: "password")

    expect( user ).to validate_uniqueness_of(:email)
    user.destroy
  end
end

