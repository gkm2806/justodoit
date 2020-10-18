require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures email presence' do
      user = User.new(password: 'supersecret123', name: 'testenaldo')
      expect(user.save).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(email: 'jorge@bol.com.br', name: 'testenaldo')
      expect(user.save).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(email: 'jorge@bol.com.br', password: 'supersecret123', name: 'testenaldo')
      expect(user.save).to eq(true)
    end
  end
end
