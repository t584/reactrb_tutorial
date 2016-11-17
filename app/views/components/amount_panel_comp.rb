class AmountPanelComp < React::Component::Base
  def render
    div.row {
      AmountBoxComp(type: 'success', amount: Record.credit, heading: 'Credit')
      AmountBoxComp(type: 'danger', amount: Record.debit, heading: 'Debit')
      AmountBoxComp(type: 'info', amount: Record.balance, heading: 'Balance') }
  end
end
