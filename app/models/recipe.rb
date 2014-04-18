class Recipe < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user

  validates_presence_of :name, :ingredients, :directions, :user_id
end
