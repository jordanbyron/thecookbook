class UsersController < ApplicationController
  def show
    @user    = User.find(params[:id])
    @recipes = @user.recipes.order("name")
    @recipes = RecipePresenter.build(@recipes)
  end
end
