# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before(:all) do
    @user = User.new(name: 'TestGuy', password: 'password',
                    password_confirmation: 'password')
    @user.save
  end
  context 'Validate User Create Account' do
    before(:each) do
      visit '/signup'
      within 'form' do
        fill_in 'user_name', with: 'clowny'
        fill_in 'user_password', with: 'clownpass'
        fill_in 'user_password_confirmation', with: 'clownpass'
      end
    end

    scenario 'should succeed' do
      click_button 'Create Account'
      expect(page).to have_content('Welcome to the app!')
    end

    scenario 'should fail with no username' do
      within 'form' do
        fill_in 'user_name', with: ''
      end
      click_button 'Create Account'
      expect(page).to have_content("Name can't be blank")
    end

    scenario 'should fail with already existing name' do
      within 'form' do
        fill_in 'user_name', with: @user.name
      end
      click_button 'Create Account'
      expect(page).to have_content('Name has already been taken')
    end

    scenario 'should fail with password < 6 chars' do
      within 'form' do
        fill_in 'user_password', with: '12345'
      end
      click_button 'Create Account'
      expect(page).to have_content('Password is too short (minimum is 6 characters)')
    end

    scenario 'should fail with no password' do
      within 'form' do
        fill_in 'user_password', with: ''
      end
      click_button 'Create Account'
      expect(page).to have_content("Password can't be blank")
    end

    scenario 'should fail if password != password_confirmation' do
      within 'form' do
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123465'
      end
      click_button 'Create Account'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end

RSpec.feature 'Users', type: :feature do
  before(:all) do
    @user = User.new(name: 'TestGuy', password: 'password',
                    password_confirmation: 'password')
    @user.save
  end
  context 'Validate User Log In' do
    before(:each) do
      visit '/login'
    end

    scenario 'should succeed' do
      visit '/signup'
      within 'form' do
        fill_in 'user_name', with: 'clowny'
        fill_in 'user_password', with: 'clownpass'
        fill_in 'user_password_confirmation', with: 'clownpass'
      end
      click_button 'Create Account'
      click_on('LOG OUT')
      visit '/login'
      within 'form' do
        fill_in id: 'session_name', with: 'clowny'
        fill_in id: 'session_password', with: 'clownpass'
      end
      click_on(id: 'log_in')
      expect(page).to have_content('You signed in successfully!')
    end

    scenario 'should fail with non-existing password' do
      within 'form' do
        fill_in 'session_name', with: User.last.name
        fill_in 'session_password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid name/password combination')
    end

    scenario 'should fail with wrong username' do
      within 'form' do
        fill_in 'session_name', with: 'brown'
        fill_in 'session_password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid name/password combination')
    end

    scenario 'should fail with wrong password' do
      within 'form' do
        fill_in 'session_name', with: User.last.name
        fill_in 'session_password', with: 'wrong'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid name/password combination')
    end
  end
end

# rubocop:enable Metrics/BlockLength