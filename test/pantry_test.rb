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

  def test_it_can_restock_ingredients
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_check_if_stock_has_enough_for_recipe
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

  def test_it_can_return_true_if_stock_has_enough_for_recipe
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    @pantry.restock(@mac, 8)

    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

end
