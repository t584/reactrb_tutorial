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
