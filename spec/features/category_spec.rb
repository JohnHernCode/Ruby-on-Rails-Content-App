# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before(:all) do
    visit '/signup'
    within 'form' do
      fill_in 'user_name', with: 'clownyst'
      fill_in 'user_password', with: 'clownpass'
      fill_in 'user_password_confirmation', with: 'clownpass'
    end
    click_button 'Create Account'
    click_on('LOG OUT')
    visit '/login'
    within 'form' do
      fill_in id: 'session_name', with: 'clownyst'
      fill_in id: 'session_password', with: 'clownpass'
    end
    click_on(id: 'log_in')
  end
  before(:each) do
    visit '/categories/new'
  end

  scenario 'should succeed' do
    within 'form' do
      fill_in 'category_name', with: 'clowns'
      fill_in 'category_priority', with: '1'
      click_button 'Create Category'
    end
    expect(page).to have_content('Category was successfully created')
  end

  scenario 'should not create the category without a name' do
    within 'form' do
      fill_in 'category_name', with: ''
      fill_in 'category_priority', with: '1'
      click_button 'Create Category'
    end
    expect(page).to have_content('Name can\'t be blank')
  end

  scenario 'should not create the category with a short name' do
    within 'form' do
      fill_in 'category_name', with: 'ab'
      fill_in 'category_priority', with: '1'
      click_button 'Create Category'
    end
    expect(page).to have_content('Name is too short')
  end

  scenario 'should not create the category with a short name' do
    within 'form' do
      fill_in 'category_name', with: 'ab'
      fill_in 'category_priority', with: '1'
      click_button 'Create Category'
    end
    expect(page).to have_content('Name is too short')
  end

  scenario 'should not create the category with a duplicate name' do
    category = Category.new(name: 'clowns', priority: '1')
    category.save
    within 'form' do
      fill_in 'category_name', with: 'clowns'
      fill_in 'category_priority', with: '2'
      click_button 'Create Category'
    end
    expect(page).to have_content('Name has already been taken')
  end

  scenario 'should not create the category with a duplicate priority' do
    category = Category.new(name: 'clowns', priority: '1')
    category.save
    within 'form' do
      fill_in 'category_name', with: 'brains'
      fill_in 'category_priority', with: '1'
      click_button 'Create Category'
    end
    expect(page).to have_content('Priority has already been taken')
  end


end
# rubocop:enable Metrics/BlockLength
