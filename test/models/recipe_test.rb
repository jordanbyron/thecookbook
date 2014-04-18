require_relative '../test_helper'

describe 'Recipe' do
  describe '#fork' do
    let(:user)          { create(:user) }
    let(:recipe)        { create(:recipe) }
    let(:forked_recipe) { recipe.fork(user) }

    it "creates a duplicate recipe" do
      forked_recipe.name.must_equal recipe.name
      forked_recipe.ingredients.must_equal recipe.ingredients
      forked_recipe.directions.must_equal recipe.directions
      forked_recipe.tag_list.must_equal recipe.tag_list
    end

    it "tracks the origin on the new fork" do
      forked_recipe.fork_origin.must_equal recipe
    end

    it "is listed in the original recipe's forks" do
      forked_recipe # Fork it!
      recipe.forks.must_include forked_recipe
    end

    it "is assigned to the new user" do
      forked_recipe.user.must_equal user
    end
  end
end
