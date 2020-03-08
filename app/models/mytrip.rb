class Mytrip < ApplicationRecord

	belongs_to :user
	attachment :image

	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

end
