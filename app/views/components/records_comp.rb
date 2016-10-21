class RecordsComp < React::Component::Base
  param :records, default: [], type: [Hash]

  before_mount do
    state.records! params.records
  end

  def add_record(record)
    records = state.records
    records << record
    state.records! records
  end

  render(:div, class: 'records') do
    h2.title { 'Records - Airpair Tutorial' }
    RecordFormComp()
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