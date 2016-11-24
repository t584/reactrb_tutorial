class ReactabularExample < React::Component::Base
  before_mount do
    state.countries!({ fi: 'Finland', dk: 'Denmark' })
    state.rows!([ { id: 100, name: 'John', tools: 'true', country: 'fi'},
                  { id: 101, name: 'Jack', tools: 'false', country: 'dk'} ])
    state.columns!( [ { property: 'name', header: { label: 'Name' } },
                      { property: 'tools', header: { label: 'Tools' } },
                      { property: 'country', header: { label: 'Country' } } ] )
    
    state.testcols!([ { property: 'name', header: { label: 'Name', transforms: [ label.on(:click){ alert("clicked ${label}") } ] } },
                      { property: 'tools', header: { label: 'Tools' } },
                      { property: 'country', header: { label: 'Country' } } ])
  end

  def render
      Reactabular::Table::Provider( class: 'pure-table pure-table-striped', columns: state.columns.to_n ) {
        Reactabular::Table::Header()
        Reactabular::Table::Body( rows: state.rows.to_n, row_key: :id ) }
  end
end