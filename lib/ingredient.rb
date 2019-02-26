class Ingredient
  attr_reader :name,
              :unit

  def initialize(name, unit, calories)
    @name = name
    @unit = unit
    @calories = calories
  end

end
