require 'rails_helper'

RSpec.describe UserFavoritedList, type: :model do
  context 'validation tests' do
    it 'ensures user presence' do
      list = FactoryBot.create(:list)
      favorite = UserFavoritedList.new(list: list)
      expect(favorite.save).to eq(false)
      expect(favorite.errors.full_messages).to eq(['User é obrigatório(a)'])
    end

    it 'ensures list presence presence' do
      user = FactoryBot.create(:user)
      favorite = UserFavoritedList.new(user: user)
      expect(favorite.save).to eq(false)
      expect(favorite.errors.full_messages).to eq(['List é obrigatório(a)'])
    end
  end
end
