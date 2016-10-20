class RecordFormComp < React::Component::Base
  before_mount do
    state.title! ''
    state.date! ''
    state.amount! ''
  end

  def valid
    state.title && state.date && state.amount
  end

  def handle_change(e)
    name = e.target.name
    state.method_missing("#{ name }",e.target.value)
  end

  def handle_submit(e)

  end

  def render
    # div { '--> RecordFormComp <--' }
    form.form_inline {
      div.form_group {
        input.form_control {
          type = 'text'
          placeholder= 'Date'
          name = 'date'
          value = state.date
          # on(:change) {|e| }
        } }
      div.form_group {
        input.form_control {
          type = 'text'
          placeholder = 'Title'
          name = 'title'
          value = state.title
          # on(:change) do |e|
          #   state.date! e.target.value
          # end
        } }
      div.form_group {
        input.form_control {
          type = 'number'
          placeholder = 'Amount'
          name = 'amount'
          value = state.amount
          # on(:change) do |e|
          #   state.date! e.target.value
          # end
        } }
      button.btn.btn_primary {
        type = 'submit'
        disabled = !valid()
        'Create record' } }
  end
end



# class RecordForm < React::Component::Base
#   render(:form, class: 'form_inline') do
#     end.on(:submit) do |e|
#       e.prevent_default
#       state.record.save
#     end
# end


# class RecordFormComp < React::Component::Base
#   param :title
#   param :date
#   param :amount
#
#   before_mount do
#     state.title! ''
#     state.date! ''
#     state.amount! ''
#   end
#
#   render(:form, class: 'form_inline') do
#     div.form_group do
#       input.form_control do
#         type: 'text'
#         placeholder: 'Date'
#         name: 'date'
#         value: state.date
#         on(:change) { handle_change }
#       button.btn.btn_primary do
#
#       end
#
#       end
#     end
#   end
#
#   def handle_change do
#     on(:change) do |e|
#       name = e.target.name
#       instance_variable_set("state.#{name}", e.target.value)
#     end
#   end
#
# end


# app/assets/javascripts/components/record_form.js.coffee

# @RecordForm = React.createClass
# ...
#     handleSubmit: (e) ->
#     e.preventDefault()
# $.post '', { record: @state }, (data) =>
#     @props.handleNewRecord data
# @setState @getInitialState()
# , 'JSON'
#
# render: ->
# React.DOM.form
# className: 'form-inline'
# onSubmit: @handleSubmit
