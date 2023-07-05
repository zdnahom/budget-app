require 'rails_helper'

RSpec.describe 'Category index page', type: :system do
  include Devise::Test::IntegrationHelpers

  describe 'index' do
    before(:each) do
     @user = User.create(name: 'Tom', email: 'nahom@gmail.com', password: '123456', confirmed_at: Time.now)
     sign_in @user
     @category = Category.create(author: @user, name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
     visit categories_path
    end

    it 'renders name of category' do
      expect(page).to have_content(@category.name)
    end

    it 'renders icon of category' do
        expect(page).to have_css("img[src*='#{@category.icon}']")
    end

    it 'When click on a category, it redirects to expenses page' do
        click_on @category.name
        expect(page).to have_content('EXPENSES')
    end
    it 'When click on Add a new category, it redirects to Add category page' do
        click_on 'Add a new category'
        expect(page).to have_content('ADD NEW CATEGORY')
    end
  end
end