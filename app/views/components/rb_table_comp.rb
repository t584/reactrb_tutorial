class RbTableComp < React::Component::Base
  before_mount do
    state.products!( [ { id: 1, name: "Product1", price: 120 },
                       { id: 2, name: "Product2", price: 80  } ] )
  end

  render do
    BootstrapTable( data: state.products.to_n, striped: true, hover: true ){
      TableHeaderColumn( data_field: 'id', is_key: true ){'Product ID'}
      TableHeaderColumn( data_field: 'name'){'Product Name'}
      TableHeaderColumn( data_field: 'price'){'Product Price'}
    }
  end
  #hypertrace instrument: :all
end