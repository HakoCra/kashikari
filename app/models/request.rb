class Request < ApplicationRecord
  belongs_to :user
  has_many :accepted_user, dependent: :destroy
  has_many :accepted_users, through: :accepted_user, source: :user

  validates :title, presence: true
end
