class RecordsComp < React::Component::Base
  def credits
    Record.all.where('amount > 0').map {|a| a[:amount].to_f}
          .inject(0){|sum,x| sum + x}.to_s
  end

  def debits
    Record.all.where('amount < 0').map {|a| a[:amount].to_f}
          .inject(0){|sum,x| sum + x}.to_s
  end

  def balance
    (debits.to_f + credits.to_f).to_s
  end

  render(:div, class: "state.credits") do
    h2.title { 'Records' }
    div.row {
      AmountBoxComp(type: 'success', amount: credits, heading: 'Credit')
      AmountBoxComp(type: 'danger', amount: debits, heading: 'Debit')
      AmountBoxComp(type: 'info', amount: balance, heading: 'Balance') }
    RecordFormComp()
    hr { nil }
    table.table.table_bordered do
      thead { tr { th { 'Date' }
                   th { 'Title' }
                   th { 'Amount' }
                   th { 'Actions' } } }
      tbody do
        Record.all.each do |record|
          RecordComp key: record[:id], record: record
        end
      end
    end
  end
end

# alert 'debug -> here I am!!!'