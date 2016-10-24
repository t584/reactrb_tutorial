class RecordsComp < React::Component::Base
  before_mount do
    state.records! Record.all
  end

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

  render(:div, class: state.credits) do
    h2.title { 'Records - Airpair Tutorial' }
    div.row {
      AmountBoxComp(type: 'success', amount: credits, heading: 'Credit')
      AmountBoxComp(type: 'danger',  amount: debits,  heading: 'Debit')
      AmountBoxComp(type: 'info',    amount: balance, heading: 'Balance') }
    RecordFormComp()
    hr { nil }
    table.table.table_bordered do
      thead do
        tr {
          th { 'Date' }
          th { 'Title' }
          th { 'Amount' } }
      end
      tbody do
        state.records.each do |record|
          RecordComp key: record[:id], record: record
        end
      end
    end
  end
end

# alert 'debug -> here I am!!!'