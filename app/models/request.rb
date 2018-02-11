class Request < ApplicationRecord
  belongs_to :user
  has_one :accepted_user, dependent: :destroy
  has_one :accepted_users, through: :accepted_user, source: :user

  validates :title, presence: true
end
