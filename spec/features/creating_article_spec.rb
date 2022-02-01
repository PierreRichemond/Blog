require 'rails_helper'

RSpec.feature 'Creating Articles' do
  scenario 'A user creates a new article' do
    visit "/" # capybara helper, makes sure we create the new article from the root page

    click_link "New Article" # capybara helper, check the link name is New Article

    fill_in "Title", with: "Creating a Blog" # capybara helper,
    fill_in "Body", with: "Lorem Ipsum" # capybara helper,

    click_button "Create Article"# capybara helper,

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end

  scenario "A user fails to create a new article" do
    visit "/" # capybara helper, makes sure we create the new article from the root page

    click_link "New Article" # capybara helper, check the link name is New Article

    fill_in "Title", with: "" # capybara helper,
    fill_in "Body", with: "" # capybara helper,

    click_button "Create Article"# capybara helper,

    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
