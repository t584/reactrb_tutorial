class RecordFormComp < React::Component::Base

  define_state :record

  before_mount :initialize_record

  def initialize_record
    state.record!({})
  end

  def invalid?
    false
  end

  def save_new_record(e)
    e.prevent_default
    Record.create(state.record) do |result, message|
      if result
        initialize_record
      else
        alert message
      end
    end
  end

  def input_field(type, attr, placeholder = nil)
    div.form_group do
      input.form_control(
        type: type,
        placeholder: placeholder || attr.camelize,
        name: attr,
        value: state.record[attr]
      ).on(:change) { |e| state.record![attr] = e.target.value }
    end
  end

  def render
    form.form_inline do
      input_field(:text, :date)
      input_field(:text, :title)
      input_field(:number, :amount)
      button.btn.btn_primary(type: :submit, disabled: invalid?) do
        'Create record'
      end.on(:click) { |e| save_new_record e }
    end
  end
end
