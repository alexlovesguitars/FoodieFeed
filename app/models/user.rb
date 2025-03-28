class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  validates :user_name, presence: true
  validates :bio, presence: true, length: { maximum: 500 }, if: :creator?
  validates :social, presence: true, length: { maximum: 255 }, if: :creator?

  has_many :cookbooks
  has_many :recipes, through: :cookbooks

  def creator?
    creator == true
  end
end
