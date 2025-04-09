class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one_attached :avatar
validates :user_name, presence: true, length: { maximum: 18 }, format: { without: /\d/, message: "cannot contain numbers" }
validates :bio, presence: true, length: { maximum: 500 }, if: :creator?
validates :instagram, length: { maximum: 255 }, if: :creator?
validates :youtube, length: { maximum: 255 }, if: :creator?

before_validation :replace_whitespace

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

  private

  def replace_whitespace
    self.user_name = user_name.gsub(/\s+/, '_') if user_name.present?
  end
end
