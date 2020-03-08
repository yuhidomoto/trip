class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :mytrips, dependent: :destroy
  validates :comment, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
