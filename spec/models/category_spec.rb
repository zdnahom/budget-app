require 'rails_helper'

RSpec.describe Category, type: :model do
  # tests go here
  before :each do
    @user = User.create(name: 'Tom') 
    @category = Category.create(author: @user, name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
  end

  describe 'Validations' do
    it 'name should be present' do
      @category.name = ''
      expect(@category).to_not be_valid
    end
    it 'Icon should be present' do
      @category.icon = ''
      expect(@category).to_not be_valid
    end
  end

end
