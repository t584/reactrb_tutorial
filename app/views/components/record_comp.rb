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
    '$ ' + amount.to_f.round(2).to_s
  end
end