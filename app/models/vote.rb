class Vote < ApplicationRecord
  belongs_to :destination
  belongs_to :participant
end
