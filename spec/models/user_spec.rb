require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  before :each do
    @user = User.create(name: 'Tom') 
  end

  describe 'Validations' do
    it 'name should be present' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

  end

end
