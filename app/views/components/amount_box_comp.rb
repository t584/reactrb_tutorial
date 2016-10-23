class AmountBoxComp < React::Component::Base
  param :type, type: String
  param :heading, type: String
  param :amount, type: String

  def render
    div.col_md_4 do
      div.panel.panel_success do
        div.panel_heading{ params.heading }
        div.panel_body{ params.amount }
      end
    end
  end

  def amount_format(amount)
    '$ ' + amount.to_f.round(2).to_s
  end
end