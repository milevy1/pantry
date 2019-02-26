class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    recipes << recipe
  end

  def summary
    recipes.map { |recipe| recipe.recipe_summary }
  end

end
