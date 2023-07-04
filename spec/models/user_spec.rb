require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  before :each do
    @user = User.create(name: 'Tom', email: 'nahom@gmail.com', password: '123456', confirmed_at: Time.now)
  end

  describe 'Validations' do
    it 'user should be created' do
      expect(@user).to be_valid
    end

    it 'name should be present' do
      @user.name = ''
      expect(@user).to_not be_valid
    end
  end
end
