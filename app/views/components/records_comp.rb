class RecordsComp < React::Component::Base
  param :records, default: [], type: [Hash]

  before_mount do
    state.records! Record.all
  end

  render(:div, class: 'records') do
    h2.title { 'Records - Airpair Tutorial' }
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