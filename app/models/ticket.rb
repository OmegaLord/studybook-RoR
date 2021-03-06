class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id, inverse_of: :tickets
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id, inverse_of: :tickets

  validates :name, :middle_name, :last_name, :passport, presence: true

  def route_name
    "#{first_station.name} - #{last_station.name}"
  end
end
