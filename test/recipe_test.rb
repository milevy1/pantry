require './test/test_helper'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_a_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_it_starts_no_ingredients_required
    expected = {}
    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_it_can_add_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    expected = {
      @cheese => 2,
      @mac => 8
    }

    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_it_can_query_amount_required_of_ingredient
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_it_can_list_all_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
  end

  def test_it_can_total_calories_of_all_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 440, @mac_and_cheese.total_calories
  end

  def test_create_ingredient_summary
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    expected = { :ingredient => "Macaroni",
                 :amount => "8 oz" }

    assert_equal expected, @mac_and_cheese.ingredient_summary(@mac)
  end

  def test_create_all_ingredients_summary_sorted_by_recipe_calories
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    expected = [ { :ingredient => "Macaroni",
                   :amount => "8 oz" },
                 { :ingredient => "Cheese",
                   :amount => "2 C" } ]

    assert_equal expected, @mac_and_cheese.all_ingredients_summary
  end

  def test_create_recipe_summary
    expected = { :name => "Mac and Cheese",
                 :details => { :ingredients => [ { :ingredient => "Macaroni",
                                                   :amount => "8 oz" },
                                                 { :ingredient => "Cheese",
                                                   :amount => "2 C" } ],
                               :total_calories => 440 } }
    assert_equal expected, @mac_and_cheese.recipe_summary
  end

end
