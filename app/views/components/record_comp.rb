class RecordComp < React::Component::Base
  param :record, type: Record

  define_state :record

  before_mount do
    state.edit! false

    state.record! params.record

    state.date!   params.record.date
    state.title!  params.record.title
    state.amount! params.record.amount
  end

  def handle_toggle(e)
    e.prevent_default
    state.edit! !state.edit
  end

  def handle_delete
    state.record.destroy do |result|
      alert 'unable to delete record' unless result
    end
  end

  def handle_update(e)
    e.prevent_default
    state.record.send("#{:date}=", state.date)
    state.record.send("#{:title}=", state.title)
    state.record.send("#{:amount}=", state.amount)
    state.record.update do |result|
      if result
        handle_toggle e
      else
        alert 'unable to update'
      end
    end
  end

  def amount_format(amount)
    "$ #{'%.02f' % amount}"
    #'$ ' + amount.to_s.reverse.gsub(/...(?!-)(?=.)/,'\&,').reverse
  end

  def record_element(type, attr, default_value)
    input.form_control( type: type,
                        name: attr,
                        defaultValue: default_value
    ).on(:change) { |e| state.method_missing("#{attr}!", e.target.value) }
  end

  def record_row
    tr { td { params.record.date.to_s }
         td { params.record.title }
         td { amount_format(params.record.amount) }
         td { a.btn.btn_default { 'Edit' }.on(:click) { |e| handle_toggle e }
              a.btn.btn_danger { 'Delete' }.on(:click) { handle_delete } } }
  end

  def record_form
    tr { td { record_element(:text, :date,   state.date) }
         td { record_element(:text, :title,  state.title) }
         td { record_element(:text, :amount, state.amount) }
         td { a.btn.btn_default { 'Update' }.on(:click) { |e| handle_update e }
              a.btn.btn_danger { 'Cancel' }.on(:click) { |e| handle_toggle e } } }
  end

  def render
    state.edit ? record_form : record_row
  end
  # hypertrace instrument: :all
end
