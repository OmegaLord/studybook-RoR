class Route < ApplicationRecord
  validates :name, presence: true

  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
end
