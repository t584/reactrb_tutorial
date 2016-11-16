class ReactableExample < React::Component::Base
  before_mount do
    state.record_1 = { Name: 'Griffin Smith', Age: 18 }
    state.record_2 = { Name: 'Lee Salminen', Age: 23  }
    state.record_3 = { Name: 'Tyle Apple', Age: 28 }
  end

  def render
    Reactable::Table(
        class: :table,
        data: [ state.record_1,
                state.record_2,
                state.record_3 ] )
  end
end
