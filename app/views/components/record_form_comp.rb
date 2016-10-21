class RecordFormComp < React::Component::Base
  before_mount do
    state.title! ''
    state.date! ''
    state.amount! ''
  end

  def invalid_input
    state.title.empty? || state.date.empty? || state.amount.empty?
  end

  def render
    form.form_inline do
      div.form_group {
        input(type: 'text',
              class: 'form-control',
              placeholder: 'Date',
              name: 'date',
              value: state.date).on(:change) { |e|
                state.date! e.target.value } }
      div.form_group {
        input(type: 'text',
              class: 'form-control',
              placeholder: 'Title',
              name: 'title',
              value: state.title).on(:change) { |e|
                state.title! e.target.value } }
      div.form_group {
        input(type: 'number',
              class: 'form-control',
              placeholder: 'Amount',
              name: 'amount',
              value: state.amount).on(:change) { |e|
                state.amount! e.target.value } }
      button(type: 'submit',
             class: 'btn btn-primary',
             disabled: invalid_input) do
               'Create record'
             end.on(:click) { save_new_record }

               # e.prevent_default
               # save_new_record
               # record = Record.create(title: 'Success')
               # before_mount
             # end
    end
  end

  def save_new_record
    # alert 'here I am!!!'
    record = Record.new(title: state.title, date: state.date, amount: state.amount)
    record.save do |result|
      alert 'unable to save' unless result
    end
    before_mount
  end
end



# class RecordForm < React::Component::Base
#   render(:form, class: 'form_inline') do
#     end.on(:submit) do |e|
#       e.prevent_default
#       state.record.save
#     end
# end