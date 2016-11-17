class ReactableExample < React::Component::Base
  before_mount do
    state.records!( [
                         {name: "SG-1", leader: "Oneil", assignment: "Exploration", members: 4},
                         {name: "SG-2", leader: "Kawalsky", assignment: "Search and Rescue", members: 5},
                         {name: "SG-3", leader: "Reynolds", assignment: "Marine Combat", members: 10},
                         {name: "SG-4", leader: "Howe", assignment: "Medical", members: 4},
                         {name: "SG-5", leader: "Davis", assignment: "Marine Combat", members: 6},
                         {name: "SG-6", leader: "Fischer", assignment: "Search and Rescue", members: 10},
                         {name: "SG-7", leader: "Isaacs", assignment: "Scientific", members: 6},
                         {name: "SG-8", leader: "Yip", assignment: "Medical", members: 6},
                         {name: "SG-9", leader: "Winters", assignment: "Diplomatic", members: 7},
                         {name: "SG-10", leader: "Colville", assignment: "Military Exploration", members: 5}
                     ] )



    state.record_1!({ Name: 'Griffin Smith', Age: 18})
    state.record_2!({ Name: 'Lee Salminen', Age: 23 })
    state.record_3!({ Name: 'Tyle Apple', Age: 28 })
  end

  def render
    Reactable.Table(
      class: :table,
      filterable: ['leader', 'assignment', 'members'],
      no_data_text: 'No matching records found',
      items_per_page: 5,
      current_page: 0,
      sortable: true,
      data: state.records.to_n ){
        Reactable.Thead{
          Reactable.Th( column: :name  ){ ('Away Team').to_n }
          Reactable.Th( column: :leader){ ('Leader').to_n }
          Reactable.Th( column: :assignment ){ ('Mission').to_n }
          Reactable.Th( column: :members ){ ('Team Members').to_n }
        }
      }
  end
end
