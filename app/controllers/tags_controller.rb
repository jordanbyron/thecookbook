class TagsController < ApplicationController
  def show
    @tag     = params[:id]
    @recipes = Recipe.tagged_with(@tag).order("name")
    @recipes = RecipePresenter.build(@recipes)
  end
end
