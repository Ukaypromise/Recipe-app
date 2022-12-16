require 'rails_helper'

RSpec.describe 'Rendering foods page', type: :feature do
  describe 'Render the view sign in' do
    it 'and review the status' do
      visit new_user_session_path
      expect(page).to have_http_status(200)
    end

    it ' and review the fields ' do
      visit new_user_session_path
      expect(page).to have_http_status(200)
      expect(page).to have_field 'Email'
      expect(page).to have_field 'Password'
    end

    it ' and reviewing the error message' do
      visit user_session_path
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'Displays an error when submitting an incorrect Email or password' do
      User.create(
        name: 'John Smith',
        email: 'correct@email.com',
        password: 'correctpassword'
      )

      visit user_session_path
      fill_in 'Email', with: 'wrong@email.com'
      fill_in 'Password', with: 'wrongpassword'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end

    it 'Successfully logs in' do
      User.create(
        name: 'John Smith',
        email: 'correct@email.com',
        password: 'correctpassword'
      )

      visit user_session_path
      fill_in 'Email', with: 'correct@email.com'
      fill_in 'Password', with: 'correctpassword'
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
