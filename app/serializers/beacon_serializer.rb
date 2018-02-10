class BeaconSerializer < ActiveModel::Serializer
  attributes :id, :major, :minor
  has_one :user
end
