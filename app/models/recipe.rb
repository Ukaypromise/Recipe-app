class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  # has_many :foods, dependent: :delete_all
  # has_many :recipes, dependent: :delete_all

  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
end
