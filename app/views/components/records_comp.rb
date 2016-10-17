class RecordsComp < React::Component::Base
  param :records, default: []

  before_mount do
    state.records! params.data
  end

  render do
    div.records {
      h2.title {
        'Records Component'
      }
      table {
        thead {
          tr {
            th { 'Date' }
            th { 'Title' }
            th { 'Amount' }
          }
        }
        tbody {
          'Table Body'
        #   # state.records.each do |record|
        #   #   RecordComp(key: record.id, record: record)
        #   # end
        }
      }
    }
  end
end
