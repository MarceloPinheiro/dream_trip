class Destination < ApplicationRecord
  validates :place, :image, :description, presence: true
  has_one_attached :image
  has_many :vote, dependent: :destroy

  scope :votes, lambda { |me = nil|
    if me.nil?
      select("place, (select count(*) from votes where destination_id=destinations.id) as votos")
        .order("votos desc")
    else
      select(
        "place, (select count(*) from votes where destination_id=destinations.id and participant_id=#{me}) as votos"
      )
        .order("votos desc")
    end
  }
end
