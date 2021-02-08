# rubocop:disable Layout/LineLength
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'email presence' do
    it 'if email not present' do
      u = User.new
      u.email = ''
      u.valid?
      expect(u.errors[:email]).to include("can't be blank")
    end

    it 'if email present' do
      u = User.new
      u.email = 'user'
      u.valid?
      expect(u.errors[:email]).to_not include("can't be blank")
    end
  end

  describe 'password presence' do
    it 'if password not present' do
      u = User.new
      u.password = ''
      u.valid?
      expect(u.errors[:password]).to include("can't be blank")
    end

    it 'if password present' do
      u = User.new
      u.password = 'pass'
      u.valid?
      expect(u.errors[:password]).to_not include("can't be blank")
    end
  end

  describe 'username and password presence' do
    it 'if both present' do
      expect(User.create!(email: 'user@example.com', username: 'test1', password: 'pass123456', name: 'lord').valid?).to be true
    end
  end
end
# rubocop:enable Layout/LineLength
