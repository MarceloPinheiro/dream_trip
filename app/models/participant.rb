class Participant < ApplicationRecord
  validates :email, :name, presence: true
end
