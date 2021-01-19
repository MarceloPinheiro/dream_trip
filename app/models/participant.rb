class Participant < ApplicationRecord
  validates :email, :name, presence: true
  has_many :vote, dependent: :destroy
end
