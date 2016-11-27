class AmountPanel < React::Component::Base
  def render
    div.row {
      AmountBox(type: 'success', amount: Record.credit, heading: 'Credit')
      AmountBox(type: 'danger', amount: Record.debit, heading: 'Debit')
      AmountBox(type: 'info', amount: Record.balance, heading: 'Balance') }
  end
end
