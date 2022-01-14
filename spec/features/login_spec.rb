require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_registration_path }

  scenario 'with valid information' do
    fill_in 'Name', with: 'Example User'
    fill_in 'Email', with: 'tom@gmail.com'
    fill_in 'Password', with: 'foobar'
    fill_in 'Confirm Password', with: 'foobar'

    click_button 'Sign Up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'with invalid information' do
    fill_in 'Name', with: 'Eer'
    fill_in 'Email', with: 'tom@gmail'
    fill_in 'Password', with: 'foobar'
    fill_in 'Confirm Password', with: 'fooar'

    click_button 'Sign Up'
    expect(page).to have_content('error prohibited this user from being saved')
  end
end
