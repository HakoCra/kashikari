class AcceptedUser < ApplicationRecord
  belongs_to :request
  belongs_to :user

  validates :request, uniqueness: { scope: :user }
end
