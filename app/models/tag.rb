class Tag < ApplicationRecord
  belongs_to :delivery
  validates :name, :delivery_id, presence: true
end
