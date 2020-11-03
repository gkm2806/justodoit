require 'rails_helper'

RSpec.describe List, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      @user = FactoryBot.create(:user)
      list = @user.lists.new
      expect(list.save).to eq(false)
      expect(list.errors.full_messages).to eq(['Name não pode ficar em branco'])
    end

    it 'ensures belongs to an user' do
      list = List.new(name: 'Fazer Café')
      expect(list.save).to eq(false)
      expect(list.errors.full_messages).to eq(['User é obrigatório(a)'])
    end

    it 'should save successfully' do
      @user = FactoryBot.create(:user)
      list = @user.lists.new(name: 'Compras 11/2020')
      expect(list.save).to eq(true)
    end
  end
end
