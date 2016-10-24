class RecordComp < React::Component::Base
  param :record, type: Hash

  def render
    tr do
      td { params.record[:date] }
      td { params.record[:title] }
      td { amount_format(params.record[:amount]) }
    end
  end

  def amount_format(amount)
    '$ ' + amount.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
  end
end