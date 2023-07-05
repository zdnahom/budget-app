require 'rails_helper'

RSpec.describe 'Category new page', type: :system do
  include Devise::Test::IntegrationHelpers

  describe 'index' do
    before(:each) do
     @user = User.create(name: 'Tom', email: 'nahom@gmail.com', password: '123456', confirmed_at: Time.now)
     sign_in @user
     @category = Category.create(author: @user, name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
     visit new_category_path
    end

    it 'renders add new category page' do
      expect(page).to have_content("ADD NEW CATEGORY")
    end

    it 'renders of name field of the add new category form' do
      expect(page).to have_field("Category name:")
    end

    it 'renders of icon field of the add new category form' do
      expect(page).to have_field("Icon:")
    end

    it 'Should fill the form and successfully add a category' do
        fill_in 'Category name:', with: 'Test Category'
        fill_in 'Icon:', with: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png'
        click_on 'Save'
        expect(page).to have_content("Test Category")
    end
  end
end