class RecordsPanelComp < React::Component::Base
  # moved the record computations (credit/debit/balance) to the model

  render do
    table.table.table_bordered do
      thead { tr { th { 'Date' }
                   th { 'Title' }
                   th { 'Amount' }
                   th { 'Actions' } } }
      tbody do
        Record.each do |record|
          RecordComp key: record.id, record: record
        end
      end
    end
  end
  #hypertrace instrument: :all
end
