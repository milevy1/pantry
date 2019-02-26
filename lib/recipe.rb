class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    ingredients_required[ingredient] += amount
  end

  def amount_required(ingredient)
    ingredients_required[ingredient]
  end

  def ingredients
    ingredients_required.keys
  end

  def total_calories
    ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end

  def ingredient_summary(ingredient)
    { ingredient: ingredient.name,
      amount: "#{amount_required(ingredient)} #{ingredient.unit}" }
  end

end
