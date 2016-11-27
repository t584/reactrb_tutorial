class AmountBox < React::Component::Base
  param :type,    type: String
  param :heading, type: String
  param :amount,  type: Numeric

  def render
    div.col_md_4 do
      div(class: "panel panel-#{params.type}"){
        div.panel_heading { params.heading }
        div.panel_body { amount_format(params.amount) } }
    end
  end

  def amount_format(amount)
    '$ ' + amount.to_s.reverse.gsub(/...(?!-)(?=.)/,'\&,').reverse
  end
end
