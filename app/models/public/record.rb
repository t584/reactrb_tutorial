class Record < ApplicationRecord
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
