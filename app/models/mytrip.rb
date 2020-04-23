class Mytrip < ApplicationRecord

	belongs_to :user
	attachment :image

	validates :country, presence: true
  validates :area, presence: true
  validates :must, presence: true
  validates :important, presence: true

	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  # user = current_user
  # (user)にcurrent_userを代入している
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
  	Mytrip.where('country LIKE ? or area LIKE ? or region LIKE ?  or year LIKE ? or airline LIKE ? or airline_comment LIKE ?
  	 or days LIKE ? or month LIKE ? or season LIKE ? or total_price LIKE ? or climate LIKE ? or prices LIKE ? or security LIKE ?
  	 or traffic LIKE ? or bathroom LIKE ? or card LIKE ? or language LIKE ? or tip LIKE ? or with_whom LIKE ? or must LIKE ?
  	 or good_point LIKE ? or bad_point LIKE ? or important LIKE ? or flight_time LIKE ?',
  	 "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%",
  	 "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%",
  	 "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
	end
end