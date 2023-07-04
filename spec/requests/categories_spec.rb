require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  let!(:user) { User.create(name: 'Tom', email: 'nahom2@gmail.com', password: '123456', confirmed_at: Time.now) }

  before :each do
    sign_in user
  end

  let!(:valid_attributes) { { author: user, name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png' } }

  let!(:invalid_attributes) { { author: user, name: '', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png' } }

  describe 'GET /index' do
    it 'should return http success' do
      get categories_path
      expect(response).to be_successful
    end
    it 'should render the correct template' do
      get categories_path
      expect(response).to render_template('index')
    end
  end

  describe 'GET /new' do
    it 'should return a successful response' do
      get new_category_path
      expect(response).to be_successful
    end

    it 'should render the correct template' do
      get new_category_path
      expect(response).to render_template('new')
    end
  end

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a new category' do
        expect do
          post categories_path, params: { category: valid_attributes }
        end.to change(Category, :count).by(1)
        expect(flash[:notice]).to eq('Category created successfully')
      end
    end
    context 'with invalid attributes' do
      it 'does not create a new category' do
        post categories_path, params: { category: invalid_attributes }
        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('Unable to create a category')
      end
    end
  end
end
