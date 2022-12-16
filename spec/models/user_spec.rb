require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Angel', email: 'test@test.com', password: '123456')
    @user.save
  end

  it 'is created succesfully' do
    expect(@user).to be_valid
  end

  it 'name is required' do
    expect(@user).to be_valid
    @user.name = nil
    expect(@user).not_to be_valid
  end

  it 'is not valid without email' do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it 'is not valid without password' do
    @user.password = ''
    expect(@user).not_to be_valid
  end
end

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many Recipes' do
      assc = described_class.reflect_on_association(:recipes)
      expect(assc.macro).to eq :has_many
    end

    it 'has many Foods' do
      assc = described_class.reflect_on_association(:foods)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is not valid without a name' do
      expect(User.new).to_not be_valid
    end
  end
end
