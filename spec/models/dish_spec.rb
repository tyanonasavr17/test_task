require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'блюда' do
    let!(:order1) { FactoryBot.create(:order, excluded_ingredients: ['ingredient1', 'ingredient2']) }
    let!(:order2) { FactoryBot.create(:order, excluded_ingredients: ['ingredient2', 'ingredient3']) }
    let!(:dish1) { FactoryBot.create(:dish, name: 'dish1') }
    let!(:dish2) { FactoryBot.create(:dish, name: 'dish2') }
    let!(:ingredient1) { FactoryBot.create(:ingredient, name: 'ingredient1', dish: dish1) }
    let!(:ingredient2) { FactoryBot.create(:ingredient, name: 'ingredient2', dish: dish1) }
    let!(:ingredient3) { FactoryBot.create(:ingredient, name: 'ingredient3', dish: dish2) }

    # it 'возвращает список блюд и их количество' do
    #   available_dishes = Dish.available_dishes_per_person
    #
    #   expect(available_dishes).to eq([{ name: 'dish2', count: 1 }])
    # end

    it 'не возвращает блюда с исключенными ингредиентами' do
      available_dishes = Dish.available_dishes_per_person

      expect(available_dishes).not_to include(name: 'dish1')
    end
  end
end