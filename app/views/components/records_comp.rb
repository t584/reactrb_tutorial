class RecordsComp < React::Component::Base
  render(:div, class: "state.credits") do
    ReactabularExample()
    hr { nil }
    h2.title { 'Records' }
    AmountPanelComp()
    RecordFormComp()
    hr { nil }
    RecordsPanelComp()
  end
  #hypertrace instrument: :all
end
