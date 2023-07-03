require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  # tests go here
  before :each do
    @user = User.create(name: 'Tom')
    @category = @user.categories.new(name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
    @expense = @user.expenses.new(name: 'expense1', amount: 4.0)
    @expense_category = ExpenseCategory.new(expense: @expense, category: @category)
  end

  it 'should have the correct category' do
    expect(@expense_category.category.name).to eq(@category.name)
  end
  it 'should have the correct expense' do
    expect(@expense_category.expense.name).to eq(@expense.name)
  end
end
