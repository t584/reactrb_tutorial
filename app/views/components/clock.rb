# module Home
class Clock < React::Component::Base

  param initial_mode: 12

  before_mount do
    state.mode! params.initial_mode
  end

  after_mount do
    @timer = every(60) { force_update! }
  end

  before_unmount do
    @timer.stop
  end

  FORMATS = {
      12 => "%a, %e %b %Y %I:%M %p",
      24 => "%a, %e %b %Y %H:%M"
  }

  def render
    div(class: :time) do
      Time.now.strftime(FORMATS[state.mode]).span
      select(style: {"marginLeft" => 20}, value: state.mode)  do
        option(value: 12) { "12 Hour Clock" }
        option(value: 24) { "24 Hour Clock" }
      end.on(:change) do |e|
        state.method_missing("mode!",(e.target.value.to_i))
      end
    end
  end
end

