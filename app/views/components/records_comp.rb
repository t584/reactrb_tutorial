class RecordsComp < React::Component::Base
  param :records, default: [], type: [Hash]

  before_mount do
    state.records! params.records
  end

  def render
    div.records do
      h2.title { 'Records' }
      table do
        thead do
          tr {
            th { 'Date' }
            th { 'Title' }
            th { 'Amount' } }
        end
        tbody do
          state.records.each do |record|
            RecordComp key: record[:id], record: record
            # li(key: record[:id]) { record[:title] }
          end
        end
      end
    end
  end
end




#   render do
#     div.records do
#       h2.title { 'Records' }
#       table do
#         thead do
#           tr {
#             th { 'Date' }
#             th { 'Title' }
#             th { 'Amount' } }
#         end
#         tbody do
#           state.records.each do |row|
#             RecordComp, key: row[:id], record: row
#           end
#         end
#       end
#     end
#   end
# end
