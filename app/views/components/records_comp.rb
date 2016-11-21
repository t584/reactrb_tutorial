class RecordsComp < React::Component::Base
  render(:div, class: "state.credits") do
    h2.title { 'Records' }
    AmountPanelComp()
    hr { nil }
    RecordFormComp()
    hr { nil }
    RecordsPanelComp()
    hr { nil }
    RbTableComp()
  end
  #hypertrace instrument: :all
end
