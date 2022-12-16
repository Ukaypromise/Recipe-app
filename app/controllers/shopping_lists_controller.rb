class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
    @total = get_total(@recipe_foods)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
  end

  private

  def get_total(recipe_foods)
    output = 0
    recipe_foods.each do |element|
      output += element.food.price * element.quantity.to_i
    end
    output
  end
end
