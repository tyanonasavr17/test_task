class Dish < ApplicationRecord
  has_many :ingredients

  def self.available_dishes_per_person
    available_dishes = []

    orders = Order.all
    dishes = Dish.all

    total_count = {}
    orders.each do |order|
      available_dishes_per_order = {}

      dishes.each do |dish|
        if order.excluded_ingredients.empty? || !contains_excluded_ingredients?(dish, order.excluded_ingredients)
          available_dishes_per_order[dish.name] = 0
          available_dishes_per_order[dish.name] += 1
        end
      end

      available_dishes_per_order.each do |name, count|
        total_count[name] ||= 0
        total_count[name] += count
      end
    end

    total_count.each do |name, count|
      if count > 0
        available_dishes << { name: name, count: count }
      end
    end

    available_dishes
  end

  private

  def self.contains_excluded_ingredients?(dish, excluded_ingredients)
    dish.ingredients.pluck(:name).any? { |ingredient| excluded_ingredients.include?(ingredient) }
  end
end