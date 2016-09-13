require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit questions_path
    click_link 'Add a new user'
    fill_in 'Email', :with => 'bacon@bacon.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign Up'
    expect(page).to have_content 'Welcome to the site'
  end

  it "gives error when no user info is entered" do
    visit questions_path
    click_on 'Add a new user'
    click_on 'Sign Up'
    expect(page).to have_content 'There was a problem creating your account. Please try again.'
  end
end
