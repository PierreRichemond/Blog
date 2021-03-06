require 'rails_helper'

RSpec.feature 'adding review/comments to articles' do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    @fred = User.create!(email: "fred@example.com", password: "password")
    @article = Article.create(title: "First Article", body: 'Lorem Ipsum', user: @john)
  end

  scenario 'permit the user to write a review for an article' do
    login_as(@fred)
    visit '/'
    click_link @article.title
    fill_in 'New Comment', with: 'An amazing article'
    click_button 'Add Comment'

    expect(page).to have_content('An amazing article')
    expect(current_path).to eq("/articles/#{@article.id}/comments")
  end
end
