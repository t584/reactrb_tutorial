class RecordsComp < React::Component::Base

  # moved the record computations (credit/debit/balance) to the model

  render(:div, class: "state.credits") do
    h2.title { 'Records' }
    div.row {
      AmountBoxComp(type: 'success', amount: Record.credit, heading: 'Credit')
      AmountBoxComp(type: 'danger', amount: Record.debit, heading: 'Debit')
      AmountBoxComp(type: 'info', amount: Record.balance, heading: 'Balance') }
    RecordFormComp()
    hr { nil }
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
