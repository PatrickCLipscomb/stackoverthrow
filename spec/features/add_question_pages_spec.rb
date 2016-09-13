require 'rails_helper'

describe "the add a question process" do
  it "adds a new question" do
    visit questions_path
    click_link 'Add a new user'
    fill_in 'Email', :with => 'bacon@bacon.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign Up'
    click_link 'Ask a question'
    fill_in 'Content', :with => "How am I here?"
    click_on 'Create Question'
    expect(page).to have_content 'How am I here?'
  end

  it "gives error when no question content is entered" do
    visit questions_path
    click_link 'Add a new user'
    fill_in 'Email', :with => 'bacon@bacon.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign Up'
    click_link 'Ask a question'
    click_on 'Create Question'
    expect(page).to have_content 'Question failed to save'
  end
end
