module V1
  class BeaconSerializer < ActiveModel::Serializer
    attributes :id, :major, :minor
    has_one :user
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :created_at
  end
end
