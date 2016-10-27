class Record < ApplicationRecord

  # you cannot have sql builders in normal methods, only in scopes
  # so we will just filter and sum up in the inject block

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
