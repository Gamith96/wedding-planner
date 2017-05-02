class Wedding < ApplicationRecord
  belongs_to :user
  has_many :guests, dependent: :destroy
  has_one :location, primary_key: "location_id", foreign_key: "id"
end
