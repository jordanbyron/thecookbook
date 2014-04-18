class Recipe < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :ingredients, :directions, :user_id
end
