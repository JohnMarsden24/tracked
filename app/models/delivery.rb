class Delivery < ApplicationRecord
  belongs_to :user
  has_many :tags
  validates :tracking_number, uniqueness: true, presence: true
  validates :user_id, presence: true
end
