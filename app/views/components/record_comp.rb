class RecordComp < React::Component::Base
  param :key, type: String
  param :record, type: Record

  def handle_delete
    params.record.destroy do |result|
      alert 'unable to delete record' unless result
    end
  end

  def render
    tr do
      td { params.record[:date] }
      td { params.record[:title] }
      td { amount_format(params.record[:amount]) }
      td { a.btn.btn_danger{'Delete'}.on(:click){ handle_delete } }
    end
  end

  def amount_format(amount)
    '$ ' + amount.to_s.reverse.gsub(/...(?!-)(?=.)/,'\&,').reverse
  end
end