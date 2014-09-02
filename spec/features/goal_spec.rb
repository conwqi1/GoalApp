require 'spec_helper'

feature "create new private goal" do 
  before(:each) do
    visit new_user_url
    fill_in "username", with: "Jeff"
    fill_in "password", with: "password"
    visit new_goal_url
    fill_in 'goal_body', :with => "This is my private goal"
    check 'goal_private'
    click_on "Submit"
  end
  
  scenario "redirect to the show page of goal" do
    expect(page).to have_content "Here is your goal"
  end
  
  scenario "show the created private goal" do
    expect(page).to have_content "This is my private goal"
  end
  
  scenario "show private goals in index page" do
    visit_page goals_url
    expect(page).to have_content "This is my private goal"
  end
  
  scenario "does not show private goal when not logged in" do
    click_on "Log Out"
    visit_page goals_url
    expect(page).not_to have_content "This is my private goal"
  end
end


feature "create new public goal" do 
  before(:each) do
    visit new_user_url
    fill_in "username", with: "Jeff"
    fill_in "password", with: "password"
    visit new_goal_url
    fill_in 'goal_body', :with => "This is my public goal"
    click_on "Submit"
  end
  
  scenario "redirect to the show page of goal" do
    expect(page).to have_content "Here is your goal"
  end
  
  scenario "show the created public goal" do
    expect(page).to have_content "This is my public goal"
  end
  
  scenario "show public goals in index page" do
    visit_page goals_url
    expect(page).to have_content "This is my public goal"
  end
  
  scenario "show public goal when not logged in" do
    click_on "Log Out"
    visit_page goals_url
    expect(page).not_to have_content "This is my public goal"
  end
end

feature "edit goal" do
  before(:each) do
    visit new_user_url
    fill_in "username", with: "Jeff"
    fill_in "password", with: "password"
    visit new_goal_url
    fill_in 'goal_body', :with => "This is my public goal"
    click_on "Submit"
    click_on "Edit"
  end
  
  scenario "redirect to the edit page of goal" do
    expect(page).to have_content "Edit your goal"
  end
  
  scenario "edit the created goal" do
    fill_in 'goal_body', :with => "This is my edited goal"
    click_on "Submit"
    expect(page).to have_content "This is my edited goal"
  end
end

feature "delete goal" do
  before(:each) do
    visit new_user_url
    fill_in "username", with: "Jeff"
    fill_in "password", with: "password"
    visit new_goal_url
    fill_in 'goal_body', :with => "This is my public goal"
    click_on "Submit"
    click_on "Delete"
  end
  
  scenario "redirect to the index page of goal" do
    expect(page).to have_content "Index of Goals"
  end
  
  scenario "deleted the created goal" do
    expect(page).not_to have_content "This is my public goal"
  end
end