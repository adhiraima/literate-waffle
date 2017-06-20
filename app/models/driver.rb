class Driver < ApplicationRecord
  include Math
  
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
  validate :latitude_in_range
  validate :longitude_in_range

  def self.drivers_in_range(lat, long, range, limit)
    values = { latitude: lat, longitude: long, range: range, limit: limit }
    Driver.where("6384000 * 2 * atan2(sqrt(pow((sin(((latitude - :latitude) * pi() / 180)/2)), 2) + (cos(latitude * pi() / 180) * cos(:latitude * pi() / 180) * pow(sin((((longitude) - (:longitude)) * pi() / 180)/2), 2))), sqrt(1 - (pow((sin(((latitude - :latitude) * pi() / 180)/2)), 2) + (cos(latitude * pi() / 180) * cos(:latitude * pi() / 180) * pow(sin((((longitude) - (:longitude)) * pi() / 180)/2), 2))))) <= 500", values)
  end

  def self.distance(lat, long)
    return 0
  end

  private

  def latitude_in_range
    errors.add(:latitude, 'is not in range') unless latitude <= 90 && latitude >= -90
  end

  def longitude_in_range
    errors.add(:longitude, 'is not in range') unless longitude <= 90 && longitude >= -90
  end

  def to_radians(val)
    val * PI / 180
  end
end
