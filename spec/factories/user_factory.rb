FactoryGirl.define do 
  #giving the factory a name 'user'
  #FG will look for class user and find it
  factory :user do
    name("Kimbo Slice")
    email("barg@barg.com")
    password("password")
    password_confirmation("password")
  end

  #need to specify the class for FG to look in
  factory :invalid_user, class: "User" do
    name nil
    email nil
    password nil
    password_confirmation nil
  end
end