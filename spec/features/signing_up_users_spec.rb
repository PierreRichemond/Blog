require 'rails_helper'

RSpec.feature 'Sign up users' do
  scenario 'With valid credentials' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
    expect(page).to have_link('Sign out')
  end

  scenario 'With invalid credentials' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'

    # expect(page).to have_content('You have not signed up successfully.')
    expect(page).not_to have_link('Sign out')
  end
end
