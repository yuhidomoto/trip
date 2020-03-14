class Mytrip < ApplicationRecord

	belongs_to :user
	attachment :image

	validates :country, presence: true

	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end
end
