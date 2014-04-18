class RecipePresenter < ApplicationPresenter
  def initialize(recipe)
    @recipe = recipe
  end

  attr_reader :recipe

  delegate :id, :name, :user, :source, :ingredients, :directions, to: :recipe

  def tag_links
    recipe.tags.map do |tag|
      h.link_to tag.name, "/tags/#{tag.name}"
    end.join(", ").html_safe
  end

  def created_by
    h.link_to user.name, "/users/#{user.id}/#{user.name.parameterize}"
  end

  def to_param
    "#{recipe.id}/#{recipe.name.parameterize}"
  end
end
