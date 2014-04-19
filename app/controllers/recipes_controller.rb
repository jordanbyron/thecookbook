class RecipesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update,
                                            :destroy, :fork]

  before_filter :find_recipe, only: [:show, :edit, :update, :destroy, :fork]
  before_filter :creator_only, except: [:index, :new, :create, :fork, :show]

  def index
    @recipes = RecipePresenter.build(Recipe.order("name"))
  end

  def show
    @recipe = RecipePresenter.new(@recipe)
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

  def fork
    forked_recipe = @recipe.fork(current_user)

    flash[:notice] = "Recipe forked!"
    redirect_to recipe_path(forked_recipe)
  end

  def destroy
    @recipe.destroy

    flash[:success] = 'Recipe deleted!'
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :directions, :source,
                                   :tag_list, :image, :remove_image)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def creator_only
    if @recipe.user != current_user
      flash[:error] = "Sorry, that's not your recipe. Why not Fork it instead?"
      redirect_to recipe_path(@recipe)
    end
  end
end
