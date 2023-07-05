require 'rails_helper'

RSpec.describe 'Expense new page', type: :system do
  include Devise::Test::IntegrationHelpers

  describe 'index' do
    before(:each) do
     @user = User.create(name: 'Tom', email: 'nahom@gmail.com', password: '123456', confirmed_at: Time.now)
     sign_in @user
     @category = Category.create(author: @user, name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
     visit new_category_expense_path(@category)
    end

    it 'renders add new expense page' do
      expect(page).to have_content("ADD NEW EXPENSE")
    end

    it 'renders name field of the add new expense form' do
      expect(page).to have_field("Expense name:")
    end

    it 'renders amount field of the add new expense form' do
      expect(page).to have_field("Amount:")
    end

    it 'renders categories field of the add new expense form' do
      expect(page).to have_field("Choose Categories:")
    end

    it 'Should fill the form and successfully add an expense' do
        fill_in 'Expense name:', with: 'Test Expense'
        fill_in 'Amount:', with: 12
        select @category.name, from: 'Choose Categories:'
        click_on 'Save'
        expect(page).to have_content("Test Expense")
    end
  end
end