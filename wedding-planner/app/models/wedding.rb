class Wedding < ApplicationRecord
  belongs_to :user
  has_many :guests
  has_one :location, foreign_key: "id"
end
