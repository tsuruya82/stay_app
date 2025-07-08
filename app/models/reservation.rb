class Reservation < ApplicationRecord
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :number_of_customers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :date_before_check_in
  validate :date_before_check_out

  belongs_to :user
  belongs_to :room

  def date_before_check_in
    return if check_in_date.blank?
    errors.add(:check_in_date, "は本日以降の日にちを選択してください"
    ) if check_in_date < Date.today
  end

  def date_before_check_out
    return if check_out_date.blank? || check_in_date.blank?
    errors.add(:check_out_date, "はチェックイン日より後の日にちを選択してください"
    ) if check_out_date <= check_in_date
  end

  def sum_of_days
    if check_in_date.present? && check_out_date.present?
      sum_of_days = (check_out_date.to_date - check_in_date.to_date).to_i
    else
      sum_of_days = 0
    end
  end

  def sum_of_fee
    if number_of_customers.present?
      (room.charge_day * number_of_customers * sum_of_days).to_i
    else
      sum_of_fee = 0
    end
  end
end
