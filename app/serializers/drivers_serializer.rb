class DriversSerializer < ActiveModel::Serializer
  attributes :id, :latitide, :longitude, :distance
end
