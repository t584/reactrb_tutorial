class ReactabularExample < React::Component::Base
  before_mount do
    state.countries!({ fi: 'Finland', dk: 'Denmark' })
    state.rows!([ { id: 100, name: 'John', tools: 'true', country: 'fi'},
                  { id: 101, name: 'Jack', tools: 'false', country: 'dk'} ])
    state.columns!([ { property: 'name', header: { label: 'Name' } },
                     { property: 'tools', header: { label: 'Tools' } },
                     { property: 'country', header: { label: 'Country' } } ])
  end

  def render
      Reactabular::Table::Provider( class: 'pure-table pure-table-striped', columns: state.columns.to_n ) {
        Reactabular::Table::Body( rows: state.rows.to_n, row_key: :id ) }
  end
end


# class ReactabularExample < React::Component::Base
#   before_mount do
#     state.countries!({ fi: 'Finland', dk: 'Denmark' })
#     state.rows!( [ { id: 100, name: 'John', tools: { hammer: true }, country: 'fi'},
#                    { id: 101, name: 'Jack', tools: { hammer: false}, country: 'dk'} ] )
#     state.col_1!( { property: 'name', header: { label: 'Name',
#                         transforms: [ label.on(:click) { alert("clicked ${label}") } ] } } )
#     state.col_2!( { property: 'tools', header: { label: 'Active',
#                         transforms: [ label.on(:click) { alert("clicked ${label}") } ] },
#                     cell: { format: (tools.hammer ? 'Hammertime' : 'nope') } } )
#     state.col_3!( { property: 'country', header: { label: 'Country',
#                         transforms: [ label.on(:click) { alert("clicked ${label}") } ] },
#                     cell: { format: state.countries[country] } } )
#     state.columns!([ state.col_1, state.col_2, state.col_3 ])
#   end
#
#   def render
#     div {
#       # 'TEST!!!'
#       Reactabular::Table.Provider( class: "pure-table pure-table-striped", columns: state.columns.to_n) {
#         Reactabular::Table.Body( rows: state.rows.to_n, row_key: "id") }
#     }
#   end
# end