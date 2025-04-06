require 'spec_helper'

describe 'User managament', type: :system do
  it 'adds a new user', js: true do
    admin = create(:admin)
    sign_in admin

    visit root_path

    click_link 'Users'
    click_link 'New User'
    fill_in 'Email', with: 'newuser@example.com'
    find('#password').fill_in 'Password', with: 'secret123'
    find('#password_confirmation').fill_in 'Password confirmation', with: 'secret123'
    click_button 'Create User'

    expect(page).to have_current_path users_path, ignore_query: true
    expect(page).to have_content 'New user created'

    within 'h1' do
      expect(page).to have_content 'Users'
    end

    expect(page).to have_content 'newuser@example.com'
    expect(User.find_by(email: 'newuser@example.com')).to be_present
  end
end
