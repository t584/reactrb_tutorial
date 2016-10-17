class RecordComp < React::Component::Base
  render do
    tr {
      td { params.record.date }
      td { params.record.title }
      td { params.record.amount } }
  end

  # def amount_format(amount) do
  #   amount.to_f.round(2).to_s
  # end
end
