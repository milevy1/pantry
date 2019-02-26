class Ingredient
  attr_reader :name

  def initialize(name, unit, calories)
    @name = name
    @unit = unit
    @calories = calories
  end

end
