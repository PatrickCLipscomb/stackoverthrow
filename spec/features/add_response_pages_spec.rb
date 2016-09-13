require 'rails_helper'

describe "the add a response process" do
  it "successfully adds a new response" do
    visit questions_path
    click_link 'Add a new user'
    fill_in 'Email', :with => 'bacon@bacon.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign Up'
    click_link 'Ask a question'
    fill_in 'Content', :with => "How am I here?"
    click_on 'Create Question'
    # user = FactoryGirl.create(:user)
    # question = user.questions.FactoryGirl.create(:question)
    click_link 'How am I here?'
    click_link 'Add a response'
    fill_in 'Content', :with => 'socioeconomic and global trends you cant control'
    click_on 'Create Response'
    expect(page).to have_content 'socioeconomic and global trends you cant control'
  end

  it "fails to add a new response" do
    visit questions_path
    click_link 'Add a new user'
    fill_in 'Email', :with => 'bacon@bacon.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign Up'
    click_link 'Ask a question'
    fill_in 'Content', :with => "How am I here?"
    click_on 'Create Question'
    click_link 'How am I here?'
    click_link 'Add a response'
    fill_in 'Content', :with => ''
    click_on 'Create Response'
    expect(page).to have_content 'Response failed to save'
  end
end
