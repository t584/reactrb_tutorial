class RecordsComp < React::Component::Base
  render(:div, class: "state.credits") do
    h2.title { 'Records' }
    AmountPanel()
    hr { nil }
    RecordForm()
    hr { nil }
    RecordsPanel()
    hr { nil }
    # RbTableComp()
  end
  #hypertrace instrument: :all
end
