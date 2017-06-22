 class Driver < ActiveRecord::Base
  include Math

  RADIUS_E = 6384000

  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
  validate :latitude_in_range
  validate :longitude_in_range

  def self.drivers_in_range(lat, long, range, limit)
    values = { latitude: lat.to_f, longitude: long.to_f, range: range, pi: PI, radius_e: RADIUS_E }
    drivers = Driver.select('id, latitude, longitude').where(":radius_e * 2 * atan2(sqrt(pow((sin(((latitude - :latitude) * :pi / 180)/2)), 2) + (cos(latitude * :pi / 180) * cos(:latitude * :pi / 180) * pow(sin((((longitude) - (:longitude)) * :pi / 180)/2), 2))), sqrt(1 - (pow((sin(((latitude - :latitude) * :pi / 180)/2)), 2) + (cos(latitude * :pi / 180) * cos(:latitude * :pi / 180) * pow(sin((((longitude) - (:longitude)) * :pi / 180)/2), 2))))) <= :range", values).limit(limit)
    drivers.each do |driver|
      driver.distance = get_distance(driver.latitude, driver.longitude, lat, long)
    end
    drivers
  end

  private

  def self.get_distance(d_lat, d_long, lat, long)
    difft = to_radians(d_lat.to_f - lat.to_f)
    diffg = to_radians(d_long.to_f - long.to_f)
    u1 = (Math.sin(difft/2) * Math.sin(difft/2)) + (Math.cos(to_radians(d_lat.to_f)) * Math.cos(to_radians(lat.to_f)) * Math.sin(diffg/2) * Math.sin(diffg/2))
    RADIUS_E * 2 * Math.atan2(Math.sqrt(u1), Math.sqrt(1 - u1))
  end

  def latitude_in_range
    errors.add(:latitude, 'is not in range') unless latitude <= 90 && latitude >= -90
  end

  def longitude_in_range
    errors.add(:longitude, 'is not in range') unless longitude <= 90 && longitude >= -90
  end

  def self.to_radians(val)
    val * (PI / 180)
  end
end
