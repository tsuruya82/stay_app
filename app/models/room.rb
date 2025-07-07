class Room < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :charge_day, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :address, presence: true

  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :reservations
end
