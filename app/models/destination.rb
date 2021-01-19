class Destination < ApplicationRecord
  validates :place, :image, presence: true
  has_one_attached :image
end
