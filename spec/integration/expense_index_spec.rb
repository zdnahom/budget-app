require 'rails_helper'

RSpec.describe 'Expense index page', type: :system do
  include Devise::Test::IntegrationHelpers

  describe 'index' do
    before(:each) do
     @user = User.create(name: 'Tom', email: 'nahom@gmail.com', password: '123456', confirmed_at: Time.now)
     sign_in @user
     @category = Category.create(author: @user, name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
     @expense = Expense.create(author: @user, name: 'expense1', amount: 4.0)
     ExpenseCategory.create(expense: @expense, category: @category)
     visit category_expenses_path(@category)
    end
    
    it 'renders name of the expense added' do
      expect(page).to have_content(@expense.name)
    end

    it 'renders amount of the expense added' do
      expect(page).to have_content(@expense.amount)
    end

    it 'renders total amount of the expense added for a category' do
      expect(page).to have_content(@category.expenses.sum(:amount))
    end

    it 'When click on Add a new expense, it redirects to Add expense page' do
        click_on 'Add a new expense'
        expect(page).to have_content('ADD NEW EXPENSE')
    end

  end
end