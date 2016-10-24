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
    '$ ' + amount.to_s.reverse.gsub(/...(?!-)(?=.)/,'\&,').reverse
  end
end