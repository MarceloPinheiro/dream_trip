class Destination < ApplicationRecord
  validates :place, :image, presence: true
  has_one_attached :image
  has_many :vote, dependent: :destroy
end
