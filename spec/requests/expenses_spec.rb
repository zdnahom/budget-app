require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers

  let!(:user) { User.create(name: 'Tom', email: 'nahom2@gmail.com', password: '123456', confirmed_at: Time.now) }

  before :each do
    sign_in user
  end

  let!(:category) { Category.create(author: user, name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png') }

  let!(:valid_attributes) { { name: 'Expense1', amount: 40, selected_categories: [] } }

  let!(:invalid_attributes) { { name: 'h', amount: 40, selected_categories: [] } }

  describe 'GET /index' do
    it 'should return http success' do
      get category_expenses_path(category)
      expect(response).to be_successful
    end
    it 'should render the correct template' do
      get category_expenses_path(category)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /new' do
    it 'should return a successful response' do
      get new_category_expense_path(category)
      expect(response).to be_successful
    end

    it 'should render the correct template' do
      get new_category_expense_path(category)
      expect(response).to render_template('new')
    end
  end

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a new expense' do
        expect do
          post category_expenses_path(category), params: { expense: valid_attributes }
        end.to change(Expense, :count).by(1)
        expect(flash[:notice]).to eq('Expense created successfully')
      end
    end
  end
end
