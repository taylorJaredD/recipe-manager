class Recipe < ApplicationRecord

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  validates :title, {presence: true}
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
