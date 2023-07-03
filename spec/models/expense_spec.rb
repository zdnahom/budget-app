require 'rails_helper'

RSpec.describe Expense, type: :model do
  # tests go here
  before :each do
    @user = User.create(name: 'Tom') 
    @expense = Expense.create(author: @user, name: 'expense1', amount: 4.0)
  end

  describe 'Validations' do
    it 'name should be present' do
      @expense.name = ''
      expect(@expense).to_not be_valid
    end
    it 'Amount should be present' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end
    it 'Amount should be a number' do
      @expense.amount = 'p'
      expect(@expense).to_not be_valid
    end
    it 'Amount should be greater than or equal to zero' do
      @expense.amount = -1
      expect(@expense).to_not be_valid
    end
  end

end
