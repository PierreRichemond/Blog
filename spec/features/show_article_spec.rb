require 'rails_helper'

RSpec.feature 'Showing an article' do

  before do
    @john = User.create!(email: "john@example.com", password: "password")
    @fred = User.create!(email: "fred@example.com", password: "password")
    @article = Article.create(title: "First Article", body: 'Lorem Ipsum', user: @john)
  end

  scenario 'non-signed in users, hide edit and delete buttons' do
    visit '/'

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link('Edit Article')
    expect(page).not_to have_link('Delete Article')
  end

  scenario 'non-owner in users, hide edit and delete buttons as well' do
    login_as(@fred)
    visit '/'

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link('Edit Article')
    expect(page).not_to have_link('Delete Article')
  end

  scenario 'A signed in user sees both Edit and Delete buttons on his articles' do
    login_as(@john)
    visit '/'

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).to have_link('Edit Article')
    expect(page).to have_link('Delete Article')
  end
end
