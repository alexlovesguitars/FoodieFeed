class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one_attached :avatar
validates :user_name, presence: true
validates :bio, presence: true, length: { maximum: 500 }, if: :creator?
validates :instagram, length: { maximum: 255 }, if: :creator?
validates :youtube, length: { maximum: 255 }, if: :creator?

  def creator?
    creator == true
  end

  has_many :recipes, dependent: :destroy
  has_many :favorites
  has_many :favorite_recipes, through: :favorites, source: :recipe
  has_many :notes, dependent: :destroy

  def saved_recipe?(recipe)
    favorites.exists?(recipe_id: recipe.id)
  end
end
