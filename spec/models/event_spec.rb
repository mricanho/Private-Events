require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'title presence' do
    it 'if title not present' do
      u = Event.new
      u.title = ''
      u.valid?
      expect(u.errors[:title]).to include("can't be blank")
    end
  end

  describe 'description presence' do
    it 'if description not present' do
      u = Event.new
      u.event = ''
      u.valid?
      expect(u.errors[:event]).to include("can't be blank")
    end
  end

  describe 'all presence' do
    it 'if user_id not present' do
      expect { Event.create!(title: 'event', event: 'description',) }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: User must exist')
    end

    it 'if all present' do
      User.create!(email: 'user@example.com', username: 'test1', password: 'pass123456', name: 'lord')
      expect(Event.create!(title: 'event', event: 'description', user_id: User.find(1).id).valid?).to be true
    end
  end
end