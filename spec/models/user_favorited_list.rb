require 'rails_helper'

RSpec.describe UserFavoritedList, type: :model do
  context 'validation tests' do
    it 'ensures user presence' do
      @list = FactoryBot.create(:list)
      favorite = UserFavoritedList.new(list: @list)
      expect(favorite.save).to eq(false)
    end

    it 'ensures list presence presence' do
      @user = FactoryBot.create(:user)
      favorite = UserFavoritedList.new(user: @user)
      expect(favorite.save).to eq(false)
    end

    it 'should save successfully' do
      @user = FactoryBot.create(:user)
      @list = FactoryBot.create(:list)
      favorite = UserFavoritedList.new(user: @user, list: @list)
      expect(favorite.save).to eq(true)
    end
  end
end
