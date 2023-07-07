require 'rails_helper'

RSpec.describe Expense, type: :model do
  include Devise::Test::IntegrationHelpers
  # tests go here
  before :each do
    @user = User.create(name: 'Tom', email: 'nahom@gmail.com', password: '123456', confirmed_at: Time.now)
    sign_in :@user
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
