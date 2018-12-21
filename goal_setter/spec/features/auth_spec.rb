require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("Create an account")
  end
  feature 'signing up a user' do
    # before :each do
    #   create(:user)
    # end
    scenario 'shows username on the homepage after signup' do
      user = User.new( { username: "joenot", password: "fjfjkdii2"} )
      create_user(user)
      expect(page).to have_content(user.username)
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    user = User.new( { username: "joenot", password: "fjfjkdii2"} )
    create_user(user)
    log_in_user(user)
    expect(page).to have_content(user.username)
  end
end

feature 'logging out' do
    before :each do
      create(:user)
    end
  scenario 'begins with a logged out state' do 
    visit user_url(User.last)
    expect(page).to have_content("Sign in")
  end 

  scenario 'doesn\'t show username on the homepage after logout'

end