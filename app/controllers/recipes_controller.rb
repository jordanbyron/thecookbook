class RecipesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update,
                                            :destroy]

  before_filter :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.order("name")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:success] = 'Recipe created!'
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = 'Problem!'
      render :new
    end
  end

  def update
    if @recipe.update_attributes(recipe_params)
      flash[:success] = 'Recipe updated!'
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = 'Problem!'
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :directions, :source)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
