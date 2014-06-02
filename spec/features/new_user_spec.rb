require 'spec_helper'

# describe 'visiting the site' do 
#   describe 'a new user visits the site' do
#     it 'says TripCollaborator' do
#       visit("/")
#       expect( page ).to have_content("TripCollaborator")
#     end
#     it 'has a link to create an account' do
#       visit ("/")
#       expect( page ).to have_content("Create Account")
#     end
#     it 'says allows a user to login' do
#       visit ("/")
#       expect( page ).to have_content("Login")
#     end
#   end  

  describe 'creating a user do' do
    describe 'signing up with valid credentials' do
      let(:user) { FactoryGirl.build(:user) } 
      it 'says user successfully created' do
        create_account(user)
        expect( page ).to have_content("Congratulations, you've successfully signed up!")
      end
    end
    # describe 'signing up with invalid credentials' do
    #   let(:invalid_user) { FactoryGirl.build(:invalid_user) }
    #   it 'says WOMP' do 
    #     create_account(invalid_user)
    #     expect( page ).to have_content("WOMP!")
    #   end
    # end
    describe 'being a logged in user' do
      let(:user) { FactoryGirl.build(:user) }
      it 'welcomes the logged in user' do      
        create_account(user)
        expect( page ).to have_content( "Hello Kimbo slice" )
      end
    end
  end
end

def create_account(user)
  visit "/"
  click_link "Create Account"
  fill_in("Name", with: user.name)
  fill_in("Email", with: user.email)
  fill_in("Password", with: user.password)
  fill_in("Password confirmation", with: user.password_confirmation)
  click_button 'Create User'
end

def login(user)
  click_link 'Login'
  fill_in('Email', with: user.email)
  fill_in('Password', with: user.password)
  click_button 'Login'
end