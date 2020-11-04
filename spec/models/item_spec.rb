require 'rails_helper'

RSpec.describe List, type: :model do
  context 'validation tests' do
    it 'ensure it can\'t exist without itemable' do
      item = Item.new(content: 'Item sem lista')
      expect(item.save).to eq(false)
      expect(item.errors.full_messages).to eq(['Itemable é obrigatório(a)'])
    end

    it 'should save successfully' do
      list = FactoryBot.create(:list)
      item = list.items.new(content: 'Tomar café')
      expect(item.save).to eq(true)
    end
  end
end
