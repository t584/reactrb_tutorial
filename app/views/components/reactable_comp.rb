class ReactableExample < React::Component::Base
  def render
    div do
      Reactable.Table(
          class: :table,
          data: [
            {Name: 'Griffin Smith', Age: 18},
            {Name: 'Lee Salminen', Age: 23},
            {Name: 'Tyle Apple', Age: 28}
          ]
      )
    end
  end
end
