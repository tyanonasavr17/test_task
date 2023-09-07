class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.distinct.pluck(:name)
  end
end