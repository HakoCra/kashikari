class Message < ApplicationRecord
  belongs_to :user
  belongs_to :target, class_name: "User"

  validates :user, presence: true
  validates :target, presence: true
  validates :text, presence: true
end
