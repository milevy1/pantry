require './test/test_helper'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new

    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)

    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_with_empty_stock
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_it_can_stock_check_an_ingredient
    assert_equal 0, @pantry.stock_check(@cheese)
  end

end
