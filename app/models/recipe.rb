class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :ingredients, presence: true
  validates :description, presence: true
  validates :method, presence: true
  validates :dietary_restrictions, presence: true
  validates :recipe_hashtags, presence: true

  has_one_attached :image
  has_many :reviews, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user
  has_many  :notes, dependent: :destroy
end
