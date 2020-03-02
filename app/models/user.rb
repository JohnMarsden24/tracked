class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :deliveries
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :display_name, presence: true
end
