require 'spec_helper'

feature "the signup process" do 

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end


  feature "signing up a user" do
    
    before(:each) do
      visit new_user_url
      fill_in 'user_username', :with => "Jeff"
      fill_in 'password', :with => "password"
      click_on "Create User"
    end
    
    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "Jeff"
    end
    
  end

end

feature "logging in" do 
  before(:each) do
    visit new_user_url
    fill_in 'user_username', :with => "Jeff"
    fill_in 'password', :with => "password"
    click_on "Create User"
    visit new_session_url
    fill_in "username", with: "Jeff"
    fill_in "password", with: "password"
    click_on "Log In"
  end
  scenario "shows username on the homepage after login" do
    expect(page).to have_content "Jeff"
  end
end

feature "logging out" do 
  before(:each) do
    visit new_user_url
    fill_in 'user_username', :with => "Jeff"
    fill_in 'password', :with => "password"
    click_on "Create User"
    click_on "Log Out"
  end
  scenario "begins with logged out state" do
    visit new_user_url
  end
  scenario "doesn't show username on the homepage after logout" do
    visit goals_url
    expect(page).not_to have_content "Jeff"
  end
end
