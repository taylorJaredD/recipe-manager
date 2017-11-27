class Recipe < ApplicationRecord

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  validates :title, {presence: true}
end
