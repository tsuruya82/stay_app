class Reservation < ApplicationRecord
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_customers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end
