class Record < ApplicationRecord
  validate :valid_date, :valid_title, :valid_amount

  def valid_date
    errors.add(:date, "must be a date") unless date.is_a? Date
  end

  def valid_title
    errors.add(:title, "cannot be blank") if title.blank?
  end

  def valid_amount
    errors.add(:amount, "must be a number") unless amount.is_a? Numeric
  end

  def self.credit
    all.inject(0) { | sum, x | sum + [x.amount.to_f, 0].max }
  end

  def self.debit
    all.inject(0) { | sum, x | sum + [x.amount.to_f, 0].min }
  end

  def self.balance
    credit + debit
  end
end
